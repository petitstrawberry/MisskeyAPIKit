//
//  Notes+GetFeatured.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

import Alamofire

public extension NotesRequest {
    struct GetFeaturedRequest: BaseRequest {
        public let endpoint: String = "notes/featured"
        public let params: [String: Any?]?

        init(
            limit: Int? = nil,
            offset: Int? = nil
        ) {
            params = [
                "limit": limit,
                "offset": offset,
            ]
        }
    }
}

public extension NotesClient {
    /// Get featured notes
    func getFeatured(_ request: NotesRequest.GetFeaturedRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
