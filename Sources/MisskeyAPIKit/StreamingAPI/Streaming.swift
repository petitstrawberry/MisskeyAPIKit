//
//  Streaming.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/24.
//

public struct Streaming {
    let client: StreamingClient
    public var mainChannel: MainChannel { MainChannel(client: client) }
    public var globalTimelineChannel: GlobalTimelineChannel { GlobalTimelineChannel(client: client) }
    public var localTimelineChannel: LocalTimelineChannel { LocalTimelineChannel(client: client) }
    public var homeTimelineChannel: HomeTimelineChannel { HomeTimelineChannel(client: client) }
    public var hybridTimelineChannel: HybridTimelineChannel { HybridTimelineChannel(client: client) }
    public var capture: StreamingCapture { StreamingCapture(client: client) }

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