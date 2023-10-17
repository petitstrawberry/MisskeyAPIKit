//
//  Drive+GetFiles.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/08/19.
//

import Alamofire
import Foundation

public extension DriveRequest {
    struct GetFilesRequest: BaseRequest {
        public let endpoint: String = "drive/files"
        public let params: [String: Any?]?

        public init(
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            folderId: String? = nil,
            type: String? = nil,
            sort: String? = nil
        ) {
            params = [
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "folderId": folderId,
                "type": type,
                "sort": sort,
            ]
        }
    }
}

public extension DriveClient {
    /// Get files
    func getFiles(_ request: DriveRequest.GetFilesRequest) async throws -> [DriveFile] {
        return try await super.request(request)
    }
}
