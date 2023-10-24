//
//  Note.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/11.
//

public class Note: Codable {
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
    public let renote: Note?
    public let reply: Note?
    public let poll: Poll?

    public enum Visibility: String, Codable {
        case `public`
        case home
        case followers
        case specified
        case `private`
        case direct
    }

    public struct Poll: Codable {
        public struct Choice: Codable {
            public let text: String
            public let votes: Int
            public let isVoted: Bool
        }

        public struct Voted: Codable {
            public let choice: Int
            public let userId: String
        }

        public let choices: [Choice]
        public let multiple: Bool
        public let expiresAt: String?
        public let expiredAfter: String?
    }

    public struct Reacted: Codable {
        public let reaction: String
        public let userId: String
    }

    public struct Deleted: Codable {
        public let deletedAt: String
    }
}
