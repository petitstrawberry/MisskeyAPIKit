//
//  Notes+GetUserListTimeline.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct GetUserListTimelineRequest: BaseRequest {
        public let endpoint: String = "notes/user-list-timeline"
        public let params: [String: Any?]?

        /// - Parameters:
        ///  - withFiles: Include files
        /// - withReplies: Include replies
        /// - fileType: File type
        /// - excludeNsfw: Exclude NSFW
        /// - limit: Limit
        /// - sinceId: Since ID
        /// - untilId: Until ID
        /// - sinceDate: Since date
        /// - untilDate: Until date
        ///
        init(
            listId: String,
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            sinceDate: Int? = nil,
            untilDate: Int? = nil,
            includeMyRenotes: Bool? = nil,
            includeRenotedMyNotes: Bool? = nil,
            includeLocalRenotes: Bool? = nil,
            withFiles: Bool? = nil
        ) {
            params = [
                "listId": listId,
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "sinceDate": sinceDate,
                "untilDate": untilDate,
                "includeMyRenotes": includeMyRenotes,
                "includeRenotedMyNotes": includeRenotedMyNotes,
                "includeLocalRenotes": includeLocalRenotes,
                "withFiles": withFiles,
            ]
        }
    }
}

public extension NotesClient {
    /// Get user list timeline
    /// - Parameters:
    /// - request: GetUserListTimelineRequest
    /// - Returns: Timeline notes
    /// - Throws: APIError, Error
    ///
    func getUserListTimeline(_ request: NotesRequest.GetUserListTimelineRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
