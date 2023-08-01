//
//  Drive+Files+Create.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/30.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct CreateRequest {
        public let endpoint: String = "drive/files/create"
        public let params: [String: Any?]?
        public let headers: HTTPHeaders? = [
            "Content-Type": "multipart/form-data",
        ]
        public let file: Data

        public init(
            file: Data,
            folderId: String? = nil,
            name: String,
            comment: String? = nil,
            isSensitive: Bool? = nil,
            force: Bool? = nil
        ) {
            self.file = file
            params = [
                "folderId": folderId,
                "name": name,
                "comment": comment,
                "isSensitive": isSensitive,
                "force": force,
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Create file
    func create(_ request: DriveRequest.Files.CreateRequest) async throws -> DriveFile {
        let url = "\(client.baseURL)/api/\(request.endpoint)"

        var params = request.params
        params?["i"] = client.credentials?.accessToken

        let response = await client.session.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in params?.compactMapValues { $0 } ?? [:] {
                    if let data = "\(value)".data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
                multipartFormData.append(
                    request.file,
                    withName: "file",
                    fileName: "file",
                    mimeType: "multipart/form-data"
                )
            },
            to: url,
            headers: request.headers
        )
        .validate(statusCode: 200 ..< 300)
        .serializingData().response

        switch response.result {
        case let .success(body):
            if body.isEmpty {
                throw APIError.invalidResponse
            }

            return try JSONDecoder().decode(DriveFile.self, from: body)

        case let .failure(error):
            switch response.response?.statusCode {
            case 400:
                if response.data == nil {
                    throw APIError.invalidResponse
                }
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: response.data!)
                throw APIError.badRequest(errorResponse.error)

            case 401:
                if response.data == nil {
                    throw APIError.invalidResponse
                }
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: response.data!)
                throw APIError.unauthorized(errorResponse.error)

            default:
                throw APIError.alamofireError(error)
            }
        }
    }
}
