//
//  Notes+Reactions+Delete.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public extension NotesRequest.Reactions {
    struct DeleteRequest: BaseRequest {
        public let endpoint: String = "notes/reactions/delete"
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

public extension NotesClient.Reactions {
    /// Delete reaction
    /// - Parameters:
    ///  - request: DeleteRequest
    /// - Throws: APIError, Error
    ///
    func delete(_ request: NotesRequest.Reactions.DeleteRequest) async throws {
        try await super.request(request)
    }
}
