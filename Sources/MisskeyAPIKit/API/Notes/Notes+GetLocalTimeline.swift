//
//  Notes+GetLocalTimeline.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/19.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct GetLocalTimelineRequest: BaseRequest {
        public let endpoint: String = "notes/local-timeline"
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
            withFiles: Bool? = nil,
            withReplies: Bool? = nil,
            fileType: [String]? = nil,
            excludeNsfw: Bool? = nil,
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            sinceDate: Int? = nil,
            untilDate: Int? = nil
        ) {
            params = [
                "withFiles": withFiles,
                "withReplies": withReplies,
                "fileType": fileType,
                "excludeNsfw": excludeNsfw,
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "sinceDate": sinceDate,
                "untilDate": untilDate,
            ]
        }
    }
}

public extension NotesClient {
    /// Get timeline
    /// - Parameters:
    /// - request: GetLocalTimelineRequest
    /// - Returns: Timeline notes
    /// - Throws: APIError, Error
    ///
    func getLocalTimeline(_ request: NotesRequest.GetLocalTimelineRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
