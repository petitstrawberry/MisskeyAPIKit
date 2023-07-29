//
//  Notes+GetMentions.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest {
    struct GetMentionsRequest: BaseRequest {
        public let endpoint: String = "notes/mentions"
        public let params: [String: Any?]?

        /// - Parameters:
        ///  - limit: Limit
        ///  - sinceId: Since ID
        ///  - untilId: Until ID
        ///  - sinceDate: Since date
        ///  - untilDate: Until date
        ///  - includeMyRenotes: Include my renotes
        ///  - includeRenotedMyNotes: Include renoted my notes
        ///  - includeLocalRenotes: Include local renotes
        ///  - withFiles: Include files
        ///  - withReplies: Include replies
        ///
        public init(
            following: Bool? = nil,
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            visibility: Note.Visibility? = nil

        ) {
            params = [
                "following": following,
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "visibility": visibility?.rawValue,
            ]
        }
    }
}

public extension NotesClient {
    /// Get home timeline
    /// - Parameters:
    /// - request: GetMentionsRequest
    /// - Returns: Timeline notes
    /// - Throws: APIError, Error
    ///
    func getMentions(_ request: NotesRequest.GetMentionsRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
