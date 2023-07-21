//
//  Notes+GetState.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public extension NotesRequest {
    struct GetStateRequest: BaseRequest {
        public let endpoint: String = "notes/state"
        public let params: [String: Any?]?

        init(
            noteId: String
        ) {
            params = [
                "noteId": noteId,
            ]
        }
    }
}

public extension NotesResponse {
    struct GetStateResponse: Codable {
        public let isFavorited: Bool
        public let isWatching: Bool
        public let isMutedThread: Bool
    }
}

public extension NotesClient {
    /// Get note's state
    func getState(_ request: NotesRequest.GetStateRequest) async throws -> NotesResponse.GetStateResponse {
        return try await super.request(request)
    }
}
