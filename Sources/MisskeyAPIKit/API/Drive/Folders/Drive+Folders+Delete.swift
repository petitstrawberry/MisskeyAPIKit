//
//  Drive+Folders+Delete.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/17.
//

import Alamofire
import Foundation

public extension DriveRequest.Folders {
    struct DeleteRequest: BaseRequest {
        public let endpoint: String = "drive/folders/delete"
        public let params: [String: Any?]?

        public init(
            folderId: String
        ) {
            params = [
                "folderId": folderId
            ]
        }
    }
}

public extension DriveClient.Folders {
    /// Delete folder
    /// - Parameters:
    ///  - request: DeleteRequest
    /// - Throws: APIError, Error
    ///
    func delete(_ request: DriveRequest.Folders.DeleteRequest) async throws {
        try await super.request(request)
    }
}
