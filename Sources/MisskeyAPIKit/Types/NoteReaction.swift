//
//  NoteReaction.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public struct NoteReaction: Codable {
    public let id: String
    public let createdAt: String
    public let user: User
    public let type: String
}
