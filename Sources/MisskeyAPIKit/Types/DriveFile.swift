//
//  DriveFile.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/15.
//

public class DriveFile: Codable {
    public struct Properties: Codable {
        let width: Int?
        let height: Int?
        let orientation: Int?
        let avgColor: String?
    }

    public let id: String
    public let createdAt: String
    public let name: String
    public let type: String
    public let md5: String
    public let size: Int
    public let isSensitive: Bool
    public let blurhash: String?
    public let properties: Properties
    public let url: String
    public let thumbnailUrl: String?
    public let comment: String?
    public let folderId: String?
    public let folder: DriveFolder?
    public let userId: String?
    public let user: User?
}
