//
//  Notes+Reactions+Create.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

import Alamofire

public extension NotesRequest.Reactions {
    struct CreateRequest: BaseRequest {
        public let endpoint: String = "notes/reactions/create"
        public let params: [String: Any?]?

        init(
            noteId: String,
            reaction: String
        ) {
            params = [
                "noteId": noteId,
                "reaction": reaction,
            ]
        }
    }
}

public extension NotesClient.Reactions {
    /// Create reaction
    /// - Parameters:
    ///  - request: CreateRequest
    /// - Throws: APIError, Error
    ///
    func create(_ request: NotesRequest.Reactions.CreateRequest) async throws {
        try await super.request(request)
    }
}
