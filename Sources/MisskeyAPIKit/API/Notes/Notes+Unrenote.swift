//
//  Notes+Unrenote.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest {
    struct UnrenoteRequest: BaseRequest {
        public let endpoint: String = "notes/unrenote"
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

public extension NotesClient {
    /// Unrenote note
    /// - Parameters:
    ///  - request: UnrenoteRequest
    /// - Returns: Created note
    /// - Throws: APIError, Error
    ///
    func unrenote(_ request: NotesRequest.UnrenoteRequest) async throws {
        return try await super.request(request)
    }
}
