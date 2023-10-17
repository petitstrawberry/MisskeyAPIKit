//
//  Drive+Files+Update.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/08/19.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct UpdateRequest: BaseRequest {
        public let endpoint: String = "drive/files/update"
        public let params: [String: Any?]?

        public init(
            fileId: String,
            folderId: String? = nil,
            name: String? = nil,
            isSensitive: Bool? = nil,
            comment: String? = nil
        ) {
            params = [
                "fileId": fileId,
                "folderId": folderId,
                "name": name,
                "isSensitive": isSensitive,
                "comment": comment,
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Update file information or location
    /// - Parameters:
    ///  - request: UpdateRequest
    /// - Returns: Updated file
    /// - Throws: APIError, Error
    ///
    func update(_ request: DriveRequest.Files.UpdateRequest) async throws -> DriveFile {
        return try await super.request(request)
    }
}
