//
//  Notes+Show.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest {
    struct ShowRequest: BaseRequest {
        public let endpoint: String = "notes/show"
        public let params: [String: Any?]?

        public init(
            noteId: String
        ) {
            params = [
                "noteId": noteId,
            ]
        }
    }
}

public extension NotesClient {
    /// Show (get) note
    func show(_ request: NotesRequest.ShowRequest) async throws -> Note {
        return try await super.request(request)
    }

    // alias of show
    func get(_ request: NotesRequest.ShowRequest) async throws -> Note {
        return try await show(request)
    }
}
