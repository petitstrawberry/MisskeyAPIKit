//
//  NotesClient+Global.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/11.
//

import Alamofire
import Foundation

public extension NotesClient {
    /// Get global timeline
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
    /// - Returns: Notes
    /// - Throws: APIError, Error
    /// - Example:
    ///   ```
    ///   let client = MisskeyAPI(baseURL: "https://misskey.io")
    ///   let notes = try await client.notes.getGlobalTimeline()
    ///   ```
    ///
    func getGlobalTimeline(
        withFiles: Bool? = nil,
        withReplies: Bool? = nil,
        fileType: [String]? = nil,
        excludeNsfw: Bool? = nil,
        limit: Int? = nil,
        sinceId: String? = nil,
        untilId: String? = nil,
        sinceDate: Int? = nil,
        untilDate: Int? = nil
    ) async throws -> [Note] {
        let params: [String: Any?] = [
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

        let request = NotesRequest(endpoint: .globalTimeline, params: params)

        let notes = try await super.request(request)

        return notes
    }
}
