//
//  Drive+Folders+Update.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/17.
//

import Alamofire
import Foundation

public extension DriveRequest.Folders {
    struct UpdateRequest: BaseRequest {
        public let endpoint: String = "drive/folders/update"
        public let params: [String: Any?]?

        public init(
            folderId: String,
            name: String? = nil,
            parentId: String? = nil
        ) {
            params = [
                "folderId": folderId,
                "name": name,
                "parentId": parentId
            ]
        }
    }
}

public extension DriveClient.Folders {
    /// Update folder information or location
    /// - Parameters:
    ///  - request: UpdateRequest
    /// - Returns: Updated fodler
    /// - Throws: APIError, Error
    ///
    func update(_ request: DriveRequest.Folders.UpdateRequest) async throws -> DriveFolder {
        return try await super.request(request)
    }
}
