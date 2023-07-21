//
//  Notes+GetReactions.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct GetReactionsRequest: BaseRequest {
        public let endpoint: String = "notes/reactions"
        public let params: [String: Any?]?

        init(
            noteId: String,
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil
        ) {
            params = [
                "noteId": noteId,
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
            ]
        }
    }
}

public extension NotesClient {
    /// Get reactions
    func getReactions(_ request: NotesRequest.GetReactionsRequest) async throws -> [NoteReaction] {
        return try await super.request(request)
    }
}
