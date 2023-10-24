//
//  MisskeyAPIKit.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/11.
//

import Alamofire

public class MisskeyAPI {

    struct Client {
        let baseURL: String
        let credentials: Credentials?
        let session: Session
    }

    public let notes: NotesClient
    public let drive: DriveClient
    public let streaming: Streaming

    // MARK: - Initializer

    public init(baseURL: String, credentials: Credentials? = nil, session: Session = .default) {
        let client = Client(baseURL: baseURL, credentials: credentials, session: session)
        notes = NotesClient(client: client)
        drive = DriveClient(client: client)
        streaming = Streaming(client: StreamingClient(client: client))
    }
}
