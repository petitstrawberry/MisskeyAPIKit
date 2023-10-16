//
//  Drive+Files+Find.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/16.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct FindRequest: BaseRequest {
        public let endpoint: String = "drive/files/find"
        public let params: [String: Any?]?

        public init(
            name: String,
            folderId: String? = nil
        ) {
            params = [
                "name": name,
                "folderId": folderId
            ]
        }
    }

    struct FindByHashRequest: BaseRequest {
        public let endpoint: String = "drive/files/find-by-hash"
        public let params: [String: Any?]?

        public init(
            md5: String
        ) {
            params = [
                "md5": md5
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Find files
    /// - Parameters:
    ///  - request: FindRequest
    /// - Returns: Files
    /// - Throws: APIError, Error
    ///
    func find(_ request: DriveRequest.Files.FindRequest) async throws -> [DriveFile] {
        return try await super.request(request)
    }

    /// Find files by hash
    /// - Parameters:
    ///   - request: FindByHashRequest
    /// - Returns: Files
    /// - Throws: APIError, Error
    ///
    func find(_ request: DriveRequest.Files.FindByHashRequest) async throws -> [DriveFile] {
        return try await super.request(request)

    }
}
