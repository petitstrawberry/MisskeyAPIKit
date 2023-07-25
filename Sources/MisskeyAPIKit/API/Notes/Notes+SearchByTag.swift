//
//  Notes+SearchByTag.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public extension NotesRequest {
    struct SearchByTagRequest: BaseRequest {
        public let endpoint: String = "notes/search-by-tag"
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
        public init(
            reply: Bool? = nil,
            renote: Bool? = nil,
            withFiles: Bool? = nil,
            poll: Bool? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            limit: Int? = nil,
            tag: String? = nil,
            query: [String]? = nil
        ) {
            params = [
                "reply": reply,
                "renote": renote,
                "withFiles": withFiles,
                "poll": poll,
                "sinceId": sinceId,
                "untilId": untilId,
                "limit": limit,
                "tag": tag,
                "query": query,
            ]
        }
    }
}

public extension NotesClient {
    /// Search notes by tag
    /// - Parameters:
    /// - request: SearchByTagRequest
    /// - Returns: Timeline notes
    /// - Throws: APIError, Error
    ///
    func searchByTag(_ request: NotesRequest.SearchByTagRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
