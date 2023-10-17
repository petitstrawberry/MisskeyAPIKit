//
//  Drive+Files+Delete.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/08/19.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct DeleteRequest: BaseRequest {
        public let endpoint: String = "drive/files/delete"
        public let params: [String: Any?]?

        public init(
            fileId: String
        ) {
            params = [
                "fileId": fileId,
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Delete file
    /// - Parameters:
    ///  - request: DeleteRequest
    /// - Throws: APIError, Error
    ///
    func delete(_ request: DriveRequest.Files.DeleteRequest) async throws {
        return try await super.request(request)
    }
}
