//
//  Notes+Polls+GetRecommendation.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

import Alamofire

public extension NotesRequest.Favorites {
    struct GetRecommendationRequest: BaseRequest {
        public let endpoint: String = "notes/polls/recommendation"
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
    /// Get recommendationed notes for poll
    /// - Parameters:
    ///  - request: GetRecommendationRequest
    /// - Throws: APIError, Error
    ///
    func getRecommendation(_ request: NotesRequest.Favorites.GetRecommendationRequest) async throws -> [Note] {
        try await super.request(request)
    }
}
