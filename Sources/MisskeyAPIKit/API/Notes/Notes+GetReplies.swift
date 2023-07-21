//
//  Notes+GetReplies.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct GetRepliesRequest: BaseRequest {
        public let endpoint: String = "notes/replies"
        public let params: [String: Any?]?

        init(
            noteId: String,
            sinceId: String? = nil,
            untilId: String? = nil,
            limit: Int? = nil
        ) {
            params = [
                "noteId": noteId,
                "sinceId": sinceId,
                "untilId": untilId,
                "limit": limit,
            ]
        }
    }
}

public extension NotesClient {
    /// Get replies
    func getReplies(_ request: NotesRequest.GetRepliesRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
