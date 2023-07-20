//
//  Get.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

import Alamofire
import Foundation

public extension NotesRequest {
    struct GetRequest: BaseRequest {
        public let endpoint: String = "notes"
        public let params: [String: Any?]?

        init(
            local: Bool? = nil,
            reply: Bool? = nil,
            renote: Bool? = nil,
            withFiles: Bool? = nil,
            poll: Bool? = nil,
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil
        ) {
            params = [
                "local": local,
                "reply": reply,
                "renote": renote,
                "withFiles": withFiles,
                "poll": poll,
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
            ]
        }
    }
}

public extension NotesClient {
    /// Get global timeline
    func get(_ request: NotesRequest.GetRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
