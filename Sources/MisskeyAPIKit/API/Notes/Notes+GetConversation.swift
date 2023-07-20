//
//  GetConversation.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct GetConversationRequest: BaseRequest {
        public let endpoint: String = "notes/conversation"
        public let params: [String: Any?]?

        init(
            noteId: String,
            limit: Int? = nil,
            offset: Int? = nil
        ) {
            params = [
                "noteId": noteId,
                "limit": limit,
                "offset": offset,
            ]
        }
    }
}

public extension NotesClient {
    /// Get conversation
    func getConversation(_ request: NotesRequest.GetConversationRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
