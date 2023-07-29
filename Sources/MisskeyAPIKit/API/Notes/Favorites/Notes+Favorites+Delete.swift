//
//  Notes+Favorites+Delete.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest.Favorites {
    struct DeleteRequest: BaseRequest {
        public let endpoint: String = "notes/favorites/delete"
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

public extension NotesClient.Favorites {
    /// Delete note
    /// - Parameters:
    ///  - request: DeleteRequest
    /// - Throws: APIError, Error
    ///
    func delete(_ request: NotesRequest.Favorites.DeleteRequest) async throws {
        try await super.request(request)
    }
}
