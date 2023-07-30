//
//  Notes+ThreadMuting+Delete.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public extension NotesRequest.ThreadMuting {
    struct DeleteRequest: BaseRequest {
        public let endpoint: String = "notes/thread-muting/delete"
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

public extension NotesClient.ThreadMuting {
    /// Delete thread muting
    /// - Parameters:
    ///  - request: DeleteRequest
    /// - Throws: APIError, Error
    ///
    func delete(_ request: NotesRequest.ThreadMuting.DeleteRequest) async throws {
        try await super.request(request)
    }
}
