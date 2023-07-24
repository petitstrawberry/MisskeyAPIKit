//
//  User.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/7/11.
//

public struct User: Codable {
    public enum OnlineStatus: String, Codable {
        case online
        case active
        case offline
        case unknown
    }

    public enum FFVisibility: String, Codable {
        case online
        case active
        case offline
        case unknown
    }

    // swift
    public let id: String
    public let username: String
    public let name: String?
    public let host: String?
    public let avatarUrl: String
    public let avatarBlurhash: String?
    public let isBot: Bool?
    public let isCat: Bool?
    public let emojis: Emoji?
    public let onlineStatus: OnlineStatus?
    public let badgeRoles: [String]?
    public let url: String?
    public let uri: String?
    public let movedTo: String?
    public let alsoKnownAs: [String]?
    public let createdAt: String?
    public let updatedAt: String?
    public let lastFetchedAt: String?
    public let bannerUrl: String?
    public let bannerBlurhash: String?
    public let isLocked: Bool?
    public let isSilenced: Bool?
    public let isSuspended: Bool?
    public let description: String?
    public let location: String?
    public let birthday: String?
    public let lang: String?
    public let fields: [String]?
    public let followersCount: Int?
    public let followingCount: Int?
    public let notesCount: Int?
    public let pinnedNoteIds: [String]?
    public let pinnedNotes: [Note]?
    public let pinnedPageId: String?
    public let pinnedPage: Page?
    public let publicReactions: Bool?
    public let ffVisibility: FFVisibility?
    public let twoFactorEnabled: Bool?
    public let usePasswordLessLogin: Bool?
    public let securityKeys: Bool?
    public let roles: [String]?
    public let memo: String?
    public let moderationNote: String?
    public let isFollowing: Bool?
    public let isFollowed: Bool?
    public let hasPendingFollowRequestFromYou: Bool?
    public let hasPendingFollowRequestToYou: Bool?
    public let isBlocking: Bool?
    public let isBlocked: Bool?
    public let isMuted: Bool?
    public let isRenoteMuted: Bool?
}
