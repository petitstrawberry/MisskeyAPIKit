//
//  Notes+Search.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

import Alamofire

public extension NotesRequest {
    struct SearchRequest: BaseRequest {
        public let endpoint: String = "notes/search"
        public let params: [String: Any?]?

        /// - Parameters:
        ///  - reply: Include reply notes
        ///  - renote: Include renote notes
        ///  - withFiles: Include files
        ///  - poll: Include poll
        ///  - sinceId: Since ID
        ///  - untilId: Until ID
        ///  - limit: Limit
        ///  - tag: Tag
        ///  - query: Query
        ///
        init(
            query: String,
            sinceId: String? = nil,
            untilId: String? = nil,
            limit: Int? = nil,
            offset: Int? = nil,
            host: String? = nil,
            userId: String? = nil,
            channelId: String? = nil
        ) {
            params = [
                "query": query,
                "sinceId": sinceId,
                "untilId": untilId,
                "limit": limit,
                "offset": offset,
                "host": host,
                "userId": userId,
                "channelId": channelId,
            ]
        }
    }
}

public extension NotesClient {
    /// Search notes
    /// - Parameters:
    /// - request: SearchRequest
    /// - Returns: Timeline notes
    /// - Throws: APIError, Error
    ///
    func search(_ request: NotesRequest.SearchRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
