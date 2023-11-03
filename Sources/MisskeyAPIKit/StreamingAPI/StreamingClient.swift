//
//  StreamingClient.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/18.
//

import Starscream
import Foundation

public class StreamingClient: WebSocketDelegate {
    private var socket: WebSocket
    private var isConnected: Bool = false

    private var onConnected: (([String: String]) -> Void)?
    private var onDisconnected: ((String, UInt16) -> Void)?
    private var onCanceled: (() -> Void)?
    private var onError: ((Error?) -> Void)?
    private var onPeerClosed: (() -> Void)?

    // State
    public enum State {
        case connected
        case disconnected
    }

    public func getState() -> State {
        if isConnected {
            return .connected
        } else {
            return .disconnected
        }
    }

    init(client: MisskeyAPI.Client) {
        let host = NSURLComponents(string: client.baseURL)!.host!
        let url = URL(string: "wss://\(host)/streaming?i=\(client.credentials?.accessToken ?? "")")!
        let request = URLRequest(url: url)
        socket = WebSocket(request: request)
        socket.delegate = self
    }

    public func connect() {
        isConnected = false
        socket.connect()
    }
    @discardableResult
    func connect() async -> [String: String] {
        isConnected = false
        var received: [String: String] = [:]
        self.onConnected { headers in
            received = headers
        }
        socket.connect()
        while !isConnected {}

        return received
    }
    func onConnected(_ callback: @escaping ([String: String]) -> Void) {
        onConnected = callback
    }
    @discardableResult
    func reconnect(resetSubscribers: Bool = false) async -> [String: String] {
        if isConnected {
            disconnect()
            while isConnected {}
        }
        let headers = await connect()
        if !resetSubscribers {
            subscibers.forEach { subscriber in
                if let channel = subscriber.channel {
                    channel.connect()
                } else if let capture = subscriber.capture {
                    capture.subscribe(id: subscriber.id)
                }
            }
        }
        return headers
    }
    func disconnect() {
        socket.disconnect()
    }
    func onDisconnected(_ callback: @escaping (String, UInt16) -> Void) {
        onDisconnected = callback
    }

    func onCanceled(_ callback: @escaping () -> Void) {
        onCanceled = callback
    }
    func onError(_ callback: @escaping (Error?) -> Void) {
        onError = callback
    }
    func onPeerClosed(_ callback: @escaping () -> Void) {
        onPeerClosed = callback
    }

    func write(string: String) {
        socket.write(string: string)
    }

    public func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {

        switch event {
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
            onConnected?(headers)
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
            onDisconnected?(reason, code)
        case .text(let string):
            print("Received text: \(string)")
            transferResponseToSubscriber(string)
        case .binary(let data):
            print("Received data: \(data.count)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
            onCanceled?()
        case .error(let error):
            isConnected = false
            // handleError(error)
            onError?(error)
        case .peerClosed:
            onPeerClosed?()
            break
        }
    }

    func transferResponseToSubscriber(_ json: String) {
        do {
            // DispatchQueue.main.async {
                print(json)
            // }

            let jsonObject = try JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: []) as! [String: Any]

            guard let body = jsonObject["body"] as? [String: Any?] else { return }
            guard let id = body["id"] as? String else { return }
            guard let eventTypeRaw = body["type"] as? String else { return }
            guard let eventType = StreamingResponse.Body.EventType(rawValue: eventTypeRaw) else { return }
            guard let eventBody = body["body"] as? [String: Any?] else { return }

            subscibers.forEach { subscriber in
                if subscriber.id == id {
                    if let channel = subscriber.channel {
                        channel.didReceive(body: StreamingResponse.Body(
                            id: id, type: eventType, body: eventBody
                        ))
                    } else if let capture = subscriber.capture {
                        capture.didReceive(body: StreamingResponse.Body(
                            id: id, type: eventType, body: eventBody
                        ))
                    }
                }
            }

        } catch {
            fatalError(error.localizedDescription)
        }
    }

    // Subscriber
    struct Subscriber {
        let id: String
        let channel: BaseChannel?
        let capture: StreamingCapture?
    }

    private var subscibers: [Subscriber] = []

    func subscribe(id: String, channel: BaseChannel? = nil, capture: StreamingCapture? = nil) {
        print("subscribe: \(id)")
        if subscibers.contains(where: { $0.id == id }) { return }
        subscibers.append(Subscriber(id: id, channel: channel, capture: capture))
    }

    func unsubscribe(id: String) {
        subscibers.removeAll(where: { $0.id == id })
    }
}
