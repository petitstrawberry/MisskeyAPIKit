//
//  Show.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct ShowRequest: BaseRequest {
        public let endpoint: String = "notes/show"
        public let params: [String: Any?]?

        init(
            noteId: String
        ) {
            params = [
                "noteId": noteId,
            ]
        }
    }
}

public extension NotesClient {
    /// Show (get) note
    func show(_ request: NotesRequest.ShowRequest) async throws -> Note {
        return try await super.request(request)
    }
}
