//
//  Role.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/7/24.
//

public struct Role: Codable {
    public struct CondFormula: Codable {
        public let id: String
        public let type: String
    }

    public struct Policies: Codable {
        public struct Value: Codable {
            public let value: Int
            public let priority: Int
            public let useDefault: Bool
        }

        public let pinLimit: Value
        public let canInvite: Value
        public let clipLimit: Value
        public let canHideAds: Value
        public let antennaLimit: Value
        public let gtlAvailable: Value
        public let ltlAvailable: Value
        public let webhookLimit: Value
        public let canPublicNote: Value
        public let userListLimit: Value
        public let wordMuteLimit: Value
        public let alwaysMarkNsfw: Value
        public let canSearchNotes: Value
        public let driveCapacityMb: Value
        public let rateLimitFactor: Value
        public let noteEachClipsLimit: Value
        public let canManageCustomEmojis: Value
        public let userEachUserListsLimit: Value
    }

    public let id: String
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let description: String?
    public let color: String?
    public let iconUrl: String?
    public let target: String?
    public let condFormula: CondFormula?
    public let isPublic: Bool?
    public let isAdministrator: Bool?
    public let isModerator: Bool?
    public let isExplorable: Bool?
    public let asBadge: Bool?
    public let canEditMembersByModerator: Bool?
    public let displayOrder: Int?
    public let policies: Policies?
    public let usersCount: Int?
}
