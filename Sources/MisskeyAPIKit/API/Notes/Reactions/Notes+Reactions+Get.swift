//
//  Notes+Reactions+Get.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public extension NotesRequest.Reactions {
    struct GetRequest: BaseRequest {
        public let endpoint: String = "notes/reactions"
        public let params: [String: Any?]?

        init(
            noteId: String,
            limit: Int? = nil,
            sinceId: String? = nil,
            untilId: String? = nil
        ) {
            params = [
                "noteId": noteId,
                "limit": limit,
                "sinceId": sinceId,
                "untilId": untilId,
            ]
        }
    }
}

public extension NotesClient.Reactions {
    /// Get reactions
    func get(_ request: NotesRequest.Reactions.GetRequest) async throws -> [NoteReaction] {
        return try await super.request(request)
    }
}
