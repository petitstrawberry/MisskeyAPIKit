//
//  DriveClient.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/30.
//

public class DriveClient: BaseClient {
    public let files: DriveClient.Files
    public let folders: DriveClient.Folders

    override init(client: MisskeyAPI.Client) {
        files = Files(client: client)
        folders = Folders(client: client)
        super.init(client: client)
    }
}
