//
//  Notes+GetRenotes.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public extension NotesRequest {
    struct GetRenotesRequest: BaseRequest {
        public let endpoint: String = "notes/renotes"
        public let params: [String: Any?]?

        public init(
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

public extension NotesClient {
    /// Get renotes
    func getRenotes(_ request: NotesRequest.GetRenotesRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
