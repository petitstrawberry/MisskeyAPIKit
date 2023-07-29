//
//  User.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/7/24.
//

public class Page: Codable {
    public struct Content: Codable {
        public let id: String
        public let text: String
        public let type: String
    }

    public let id: String
    public let createdAt: String?
    public let updatedAt: String?
    public let userId: String?
    public let user: User?
    public let content: [Content]?
    public let variables: [String]?
    public let title: String?
    public let name: String?
    public let summary: String?
    public let hideTitleWhenPinned: Bool?
    public let alignCenter: Bool?
    public let font: String?
    public let script: String?
    public let eyeCatchingImageId: String?
    public let eyeCatchingImage: DriveFile?
    public let attachedFiles: [DriveFile]?
    public let likedCount: Int?
    public let isLiked: Bool?
    public let isPinned: Bool?
}
