//
//  Drive+Files+Show.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/08/19.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct ShowRequest: BaseRequest {
        public let endpoint: String = "drive/files/show"
        public let params: [String: Any?]?

        public init(
            fileId: String,
            url: String? = nil
        ) {
            params = [
                "fileId": fileId,
                "url": url,
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Show file
    /// - Parameters:
    ///  - request: ShowRequest
    /// - Throws: APIError, Error
    ///
    func show(_ request: DriveRequest.Files.ShowRequest) async throws -> DriveFile {
        return try await super.request(request)
    }
}
