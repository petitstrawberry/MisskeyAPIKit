//
//  Emoji.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/21.
//

public struct Emoji: Codable {
    public let id: String
    public let aliases: [String]?
    public let name: String
    public let category: String?
    public let host: String?
    public let url: String?
    public let license: String?
    public let localOnly: Bool?
    public let isSensitive: Bool?
    public let roleIdsThatCanBeUsedThisEmojiAsReaction: [String]?
}
