//
//  Notes+GetTimeline.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest {
    struct GetTimelineRequest: BaseRequest {
        public let endpoint: String = "notes/timeline"
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
        init(
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            sinceDate: Int? = nil,
            untilDate: Int? = nil,
            includeMyRenotes: Bool? = nil,
            includeRenotedMyNotes: Bool? = nil,
            includeLocalRenotes: Bool? = nil,
            withFiles: Bool? = nil,
            withReplies: Bool? = nil
        ) {
            params = [
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "sinceDate": sinceDate,
                "untilDate": untilDate,
                "includeMyRenotes": includeMyRenotes,
                "includeRenotedMyNotes": includeRenotedMyNotes,
                "includeLocalRenotes": includeLocalRenotes,
                "withFiles": withFiles,
                "withReplies": withReplies,
            ]
        }
    }
}

public extension NotesClient {
    /// Get home timeline
    /// - Parameters:
    /// - request: GetTimelineRequest
    /// - Returns: Timeline notes
    /// - Throws: APIError, Error
    ///
    func getTimeline(_ request: NotesRequest.GetTimelineRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
