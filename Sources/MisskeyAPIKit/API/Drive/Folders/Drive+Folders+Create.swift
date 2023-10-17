//
//  Drive+Folders+Create.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/17.
//

import Alamofire
import Foundation

public extension DriveRequest.Folders {
    struct CreateRequest: BaseRequest {
        public let endpoint: String = "drive/folders/create"
        public let params: [String: Any?]?

        public init(
            name: String,
            parentId: String? = nil
        ) {
            params = [
                "name": name,
                "parentId": parentId
            ]
        }
    }
}

public extension DriveClient.Folders {
    /// Create folder
    /// - Parameters:
    ///  - request: CreateRequest
    /// - Returns: Created folder
    /// - Throws: APIError, Error
    ///
    func create(_ request: DriveRequest.Folders.CreateRequest) async throws -> DriveFolder {
        return try await super.request(request)
    }
}
