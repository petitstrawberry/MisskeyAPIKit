//
//  Notes+GetChildren.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest {
    struct GetChildrenRequest: BaseRequest {
        public let endpoint: String = "notes/children"
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
    /// Get children
    func getChildren(_ request: NotesRequest.GetChildrenRequest) async throws -> [Note] {
        return try await super.request(request)
    }
}
