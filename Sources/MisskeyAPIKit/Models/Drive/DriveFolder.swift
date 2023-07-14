//
//  DriveFolder.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/15.
//

public struct DriveFolder: Codable {
    public let id: String
    public let createdAt: String
    public let name: String
    public let userId: String?
    public let user: User?
    public let parentId: String?
    // public let parent: DriveFolder?
}
