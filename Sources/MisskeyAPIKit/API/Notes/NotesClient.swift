//
//  NotesClient.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/11.
//

import Alamofire

public class NotesClient: BaseClient {
    public let favorites: Favorites
    public let polls: Polls
    public let reactions: Reactions
    public let threadMuting: ThreadMuting

    override init(client: MisskeyAPI.Client) {
        favorites = .init(client: client)
        polls = .init(client: client)
        reactions = .init(client: client)
        threadMuting = .init(client: client)

        super.init(client: client)
    }
}
