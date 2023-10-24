//
//  Streaming.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/24.
//

public struct Streaming {
    let client: StreamingClient
    var mainChannel: MainChannel { MainChannel(client: client) }
    var globalTimelineChannel: GlobalTimelineChannel { GlobalTimelineChannel(client: client) }
    var localTimelineChannel: LocalTimelineChannel { LocalTimelineChannel(client: client) }
    var homeTimelineChannel: HomeTimelineChannel { HomeTimelineChannel(client: client) }
    var hybridTimelineChannel: HybridTimelineChannel { HybridTimelineChannel(client: client) }
    var capture: StreamingCapture { StreamingCapture(client: client) }

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