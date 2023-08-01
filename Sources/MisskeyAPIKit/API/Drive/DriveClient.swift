//
//  DriveClient.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/30.
//

public class DriveClient: BaseClient {
    public let files: DriveClient.Files

    override init(client: MisskeyAPI.Client) {
        files = Files(client: client)
        super.init(client: client)
    }
}
