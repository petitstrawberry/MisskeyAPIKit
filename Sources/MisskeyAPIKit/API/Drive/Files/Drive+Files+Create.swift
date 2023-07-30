//
//  Drive+Files+Create.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/30.
//

import Foundation

public extension DriveRequest.Files {
    struct CreateRequest: BaseRequest {
        public let endpoint: String = "drive/files/create"
        public let params: [String: Any?]?

        public init(
            folderId: String? = nil,
            name: String,
            file: Data,
            comment: String? = nil,
            isSensitive: Bool? = nil,
            force: Bool? = nil
        ) {
            params = [
                "folderId": folderId,
                "name": name,
                "file": file,
                "comment": comment,
                "isSensitive": isSensitive,
                "force": force,
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Create file
    func create(_ request: DriveRequest.Files.CreateRequest) async throws -> DriveFile {
        return try await super.request(request)
    }
}
