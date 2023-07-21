//
//  Notes+Polls+Vote.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest.Favorites {
    struct VoteRequest: BaseRequest {
        public let endpoint: String = "notes/polls/vote"
        public let params: [String: Any?]?

        init(
            noteId: String,
            choice: Int
        ) {
            params = [
                "noteId": noteId,
                "choice": choice,
            ]
        }
    }
}

public extension NotesClient.Favorites {
    /// Vote poll
    /// - Parameters:
    ///  - request: VoteRequest
    /// - Throws: APIError, Error
    ///
    func vote(_ request: NotesRequest.Favorites.VoteRequest) async throws {
        try await super.request(request)
    }
}
