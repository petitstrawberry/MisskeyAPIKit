//
//  Note.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/11.
//

public struct Note: Codable {
    public let id: String
    public let createdAt: String
    public let text: String?
    public let cw: String?
    public let userId: String
    public let user: User
    public let visibility: Visibility
    public let localOnly: Bool
    public let renoteCount: Int
    public let repliesCount: Int
    // public let reactions: Reactions
    // public let reactionEmojis: ReactionEmojis
    public let fileIds: [String]
    public let files: [DriveFile]
    public let replyId: String?
    public let renoteId: String?
    // public let renote: Note?
    // public let reply: Note?

    public enum Visibility: String, Codable {
        case `public`
        case home
        case followers
        case specified
        case `private`
        case direct
    }
}
