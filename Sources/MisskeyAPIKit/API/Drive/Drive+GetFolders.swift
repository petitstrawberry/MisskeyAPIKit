//
//  Drive+GetFolders.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/17.
//

import Alamofire
import Foundation

public extension DriveRequest {
    struct GetFoldersRequest: BaseRequest {
        public let endpoint: String = "drive/folders"
        public let params: [String: Any?]?

        public init(
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            folderId: String? = nil
        ) {
            params = [
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "folderId": folderId
            ]
        }
    }
}

public extension DriveClient {
    /// Get folders
    /// - Parameters:
    ///   - request: GetFoldersRequest
    /// - Returns: Folders
    /// - Throws: APIError, Error
    ///
    func getFolders(_ request: DriveRequest.GetFoldersRequest) async throws -> [DriveFolder] {
        return try await super.request(request)
    }
}
