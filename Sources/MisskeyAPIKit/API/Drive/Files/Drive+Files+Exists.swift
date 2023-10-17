//
//  Drive+Files+Exists.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/08/19.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct ExistsRequest: BaseRequest {
        public let endpoint: String = "drive/files/check-existence"
        public let params: [String: Any?]?

        public init(
            md5: String
        ) {
            params = [
                "md5": md5,
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Check existence of file
    /// - Parameters:
    ///  - request: ExistsRequest
    /// - Throws: APIError, Error
    ///
    func exists(_ request: DriveRequest.Files.ExistsRequest) async throws -> Bool {
        return try await super.request(request)
    }
}
