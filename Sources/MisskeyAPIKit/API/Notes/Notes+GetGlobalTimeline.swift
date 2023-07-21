//
//  Notes+GetGlobalTimeline.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/19.
//

public extension NotesRequest {
    struct GetGlobalTimelineRequest: BaseRequest {
        public let endpoint: String = "notes/global-timeline"
        public let params: [String: Any?]?

        init(withFiles: Bool? = nil,
             withReplies: Bool? = nil,
             fileType: [String]? = nil,
             excludeNsfw: Bool? = nil,
             limit: Int? = nil,
             sinceId: String? = nil,
             untilId: String? = nil,
             sinceDate: Int? = nil,
             untilDate: Int? = nil)
        {
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
    /// Get global timeline
    func getGlobalTimeline(_ request: NotesRequest.GetGlobalTimelineRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
