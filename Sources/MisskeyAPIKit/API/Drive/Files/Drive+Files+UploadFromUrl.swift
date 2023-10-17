//
//  Drive+Files+UploadFromUrl.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/08/19.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct UploadFromUrlRequest: BaseRequest {
        public let endpoint: String = "drive/files/upload-from-url"
        public let params: [String: Any?]?

        public init(
            url: String,
            folderId: String? = nil,
            isSensitive: Bool? = nil,
            comment: String? = nil,
            marker: String? = nil,
            force: Bool? = nil
        ) {
            params = [
                "url": url,
                "folderId": folderId,
                "isSensitive": isSensitive,
                "comment": comment,
                "marker": marker,
                "force": force,
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Upload file from url
    /// - Parameters:
    ///  - request: UploadFromUrlRequest
    /// - Throws: APIError, Error
    ///
    func uploadFromUrl(_ request: DriveRequest.Files.UploadFromUrlRequest) async throws {
        return try await super.request(request)
    }
}
