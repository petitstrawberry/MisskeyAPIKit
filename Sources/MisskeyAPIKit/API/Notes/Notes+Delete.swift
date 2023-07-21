//
//  Notes+Delete.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/20.
//

public extension NotesRequest {
    struct DeleteRequest: BaseRequest {
        public let endpoint: String = "notes/delete"
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
    /// Delete note
    /// - Parameters:
    ///  - request: DeleteRequest
    /// - Returns: Created note
    /// - Throws: APIError, Error
    ///
    func delete(_ request: NotesRequest.DeleteRequest) async throws {
        return try await super.request(request)
    }
}
