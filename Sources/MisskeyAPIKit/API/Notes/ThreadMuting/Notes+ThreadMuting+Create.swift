//
//  Notes+ThreadMuting+Create.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

import Alamofire

public extension NotesRequest.ThreadMuting {
    struct CreateRequest: BaseRequest {
        public let endpoint: String = "notes/thread-muting/create"
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
    /// Create thread muting
    /// - Parameters:
    ///  - request: CreateRequest
    /// - Throws: APIError, Error
    ///
    func create(_ request: NotesRequest.ThreadMuting.CreateRequest) async throws {
        try await super.request(request)
    }
}
