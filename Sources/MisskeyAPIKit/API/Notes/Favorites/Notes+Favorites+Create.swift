//
//  Notes+Favorites+Create.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest.Favorites {
    struct CreateRequest: BaseRequest {
        public let endpoint: String = "notes/favorites/create"
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

public extension NotesClient.Favorites {
    /// Create note
    /// - Parameters:
    ///  - request: CreateRequest
    /// - Throws: APIError, Error
    ///
    func create(_ request: NotesRequest.Favorites.CreateRequest) async throws {
        try await super.request(request)
    }
}
