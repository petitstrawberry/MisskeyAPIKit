//
//  Notes+GetReactions.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

import Alamofire

public extension NotesClient {
    /// alias of NotesClient.Reactions.get
    func getReactions(_ request: NotesRequest.Reactions.GetRequest) async throws -> [NoteReaction] {
        return try await super.request(request)
    }
}
