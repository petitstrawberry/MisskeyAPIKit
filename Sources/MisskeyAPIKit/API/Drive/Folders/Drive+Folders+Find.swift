//
//  Drive+Folders+Find.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/17.
//

import Alamofire
import Foundation

public extension DriveRequest.Folders {
    struct FindRequest: BaseRequest {
        public let endpoint: String = "drive/folders/find"
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
    /// Find folders
    /// - Parameters:
    ///  - request: FindRequest
    /// - Returns: Files
    /// - Throws: APIError, Error
    ///
    func find(_ request: DriveRequest.Folders.FindRequest) async throws -> [DriveFolder] {
        return try await super.request(request)
    }
}
