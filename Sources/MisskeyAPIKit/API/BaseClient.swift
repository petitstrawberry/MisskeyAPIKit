//
//  BaseClient.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/15.
//

import Alamofire
import Foundation

public class BaseClient {
    let client: MisskeyAPI.Client

    init(client: MisskeyAPI.Client) {
        self.client = client
    }

    func request<T: Codable>(_ request: BaseRequest) async throws -> T {
        let url = "\(client.baseURL)/api/\(request.endpoint)"

        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]

        var params = request.params
        params?["i"] = client.credentials?.accessToken

        let response = await client.session.request(
            url,
            method: .post,
            parameters: params?.compactMapValues { $0 },
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate(statusCode: 200 ..< 300)
        .serializingData().response

        switch response.result {
        case let .success(body):
            if body.isEmpty {
                throw APIError.invalidResponse
            }

            return try JSONDecoder().decode(T.self, from: body)

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
