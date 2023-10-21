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

    public struct Streaming {
        let client: StreamingClient
        var mainChannel: MainChannel { MainChannel(client: client) }
        var globalTimelineChannel: GlobalTimelineChannel { GlobalTimelineChannel(client: client) }

        public func connect() {
            client.connect()
        }
        public func connect() async {
            await client.connect()
        }
        public func disconnect() {
            client.disconnect()
        }

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
