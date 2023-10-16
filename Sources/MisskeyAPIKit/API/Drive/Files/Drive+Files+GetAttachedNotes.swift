//
//  Drive+Files+GetAttachedNotes.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/16.
//

import Alamofire
import Foundation

public extension DriveRequest.Files {
    struct GetAttachedNotesRequest: BaseRequest {
        public let endpoint: String = "drive/files/attached-notes"
        public let params: [String: Any?]?

        public init(
            sinceId: String? = nil,
            untilId: String? = nil,
            limit: Int? = nil,
            fileId: String
        ) {
            params = [
                "sinceId": sinceId,
                "untilId": untilId,
                "limit": limit,
                "fileId": fileId
            ]
        }
    }
}

public extension DriveClient.Files {
    /// Get attached notes
    /// - Parameters:
    ///  - request: GetAttachedNotesRequest
    /// - Returns: Notes
    /// - Throws: APIError, Error
    ///
    func getAttachedNotes(_ request: DriveRequest.Files.GetAttachedNotesRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
