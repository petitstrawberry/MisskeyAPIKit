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

    // isConnected
    public var isConnected: Bool {
        client.getState() == .connected
    }

    // connect

    public func connect() {
        client.connect()
    }
    public func connect(_ onConnected: @escaping ([String: String]) -> Void) {
        client.onConnected(onConnected)
        connect()
    }
    @discardableResult
    public func connect() async -> [String: String] {
        let headers = await client.connect()
        return headers
    }

    // reconnect

    public func reconnect() {
        Task {
            await client.reconnect()
        }
    }
    public func reconnect(_ onReconnected: @escaping ([String: String]) -> Void) {
        Task {
            let headers = await client.reconnect()
            onReconnected(headers)
        }
    }
    @discardableResult
    public func reconnect() async -> [String: String] {
        return await client.reconnect()
    }

    // disconnect

    public func disconnect() {
        client.disconnect()
    }
    public func disconnect() async {
        client.disconnect()
        while client.getState() == .connected {}
    }

    // onEvent

    @discardableResult
    public func onDisconnected(_ callback: @escaping (String, UInt16) -> Void) -> Self {
        client.onDisconnected(callback)
        return self
    }
    @discardableResult
    public func onCanceled(_ callback: @escaping () -> Void) -> Self {
        client.onCanceled(callback)
        return self
    }
    @discardableResult
    public func onError(_ callback: @escaping (Error?) -> Void) -> Self {
        client.onError(callback)
        return self
    }
    @discardableResult
    public func onPeerClosed(_ callback: @escaping () -> Void) -> Self {
        client.onPeerClosed(callback)
        return self
    }
}
