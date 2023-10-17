//
//  Drive+Folders+Show.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/17.
//

import Alamofire
import Foundation

public extension DriveRequest.Folders {
    struct ShowRequest: BaseRequest {
        public let endpoint: String = "drive/folders/show"
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
    /// Show folder
    /// - Parameters:
    ///  - request: FindRequest
    /// - Returns: Files
    /// - Throws: APIError, Error
    ///
    func show(_ request: DriveRequest.Folders.ShowRequest) async throws -> DriveFolder {
        return try await super.request(request)
    }
}
