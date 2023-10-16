//
//  Drive+Files+Find.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/08/19.
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
}

public extension DriveClient.Files {
    /// Find files
    /// - Parameters:
    ///  - name: File name
    /// - folderId: Folder ID
    /// - Returns: Files
    /// - Throws: APIError, Error
    ///
    func find(_ request: DriveRequest.Files.FindRequest) async throws -> [DriveFile] {
        return try await super.request(request)
    }
}
