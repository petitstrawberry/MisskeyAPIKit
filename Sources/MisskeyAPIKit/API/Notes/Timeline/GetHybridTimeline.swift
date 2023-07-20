//
//  GetLocalTimeline.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct GetHybridTimelineRequest: BaseRequest {
        public let endpoint: String = "notes/hybrid-timeline"
        public let params: [String: Any?]?

        init(
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil,
            sinceDate: Int? = nil,
            untilDate: Int? = nil,
            IncludeMyRenotes _: Bool? = nil,
            includeRenotedMyNotes _: Bool? = nil,
            includeLocalRenotes _: Bool? = nil,
            withFiles: Bool? = nil,
            withReplies: Bool? = nil
        ) {
            params = [
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
                "sinceDate": sinceDate,
                "untilDate": untilDate,
                "includeMyRenotes": nil,
                "includeRenotedMyNotes": nil,
                "includeLocalRenotes": nil,
                "withFiles": withFiles,
                "withReplies": withReplies,
            ]
        }
    }
}

public extension NotesClient {
    /// Get Hybrid (Social) timeline
    /// - Parameters:
    /// - request: GetHybridTimelineRequest
    /// - Returns: Hybrid (Social) timeline notes
    /// - Throws: APIError, Error
    ///
    func getHybridTimeline(_ request: NotesRequest.GetHybridTimelineRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
