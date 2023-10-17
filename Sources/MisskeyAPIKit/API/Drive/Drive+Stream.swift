//
//  Drive+Stream.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/17.
//

import Alamofire
import Foundation

public extension DriveRequest {
    struct StreamRequest: BaseRequest {
        public let endpoint: String = "drive/stream"
        public let params: [String: Any?]?

        public init(
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            type: String? = nil
        ) {
            params = [
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "type": type
            ]
        }
    }
}

public extension DriveClient {
    /// Get files across all folders
    func stream(_ request: DriveRequest.StreamRequest) async throws -> [DriveFile] {
        return try await super.request(request)
    }
}
