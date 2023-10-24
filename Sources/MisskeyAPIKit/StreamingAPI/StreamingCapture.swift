//
//  StreamingCapture.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/18.
//

import Starscream
import Foundation

private struct ConnectionRequest: Codable {

    enum RequestType: String, Codable {
        case subNote
        case unsubNote
    }

    struct Body: Codable {
        let id: String

        init(id: String) {
            self.id = id
        }
    }

    let type: RequestType
    let body: Body?
}

public class StreamingCapture {
    let client: StreamingClient
    var id: String = ""

    public init(client: StreamingClient) {
        self.client = client
    }


    public func subscribe(id: String) -> Self {
        // default implementation
        let connectionRequest = ConnectionRequest(
            type: .subNote, body: .init(id: id)
        )

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(connectionRequest)
            let json = String(data: data, encoding: .utf8)!
            client.write(string: json)
            client.subscribe(id: id, capture: self)
            self.id = id
        } catch {
            print(error)
        }

        return self
    }

    public func unsubscribe() {
        let connectionRequest = ConnectionRequest(
            type: .unsubNote, body: .init(id: id)
        )

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(connectionRequest)
            let json = String(data: data, encoding: .utf8)!
            client.write(string: json)
            client.unsubscribe(id: id)
        } catch {
            print(error)
        }
    }

    func didReceive(body: StreamingResponse.Body) {
        switch body.type {
        case .reacted:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.Reacted.self, from: data)
                self.onReacted?(note)
            } catch {
                print(error)
            }
        case .unreacted:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.Reacted.self, from: data)
                self.onUnreacted?(note)
            } catch {
                print(error)
            }
        case .pollVoted:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.Poll.Voted.self, from: data)
                self.onPollVoted?(note)
            } catch {
                print(error)
            }
        case .deleted:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.Deleted.self, from: data)
                self.onDeleted?(note)
            } catch {
                print(error)
            }
        default:
            break
        }
    }

    var onReacted: ((MisskeyAPIKit.Note.Reacted) -> Void)?
    public func onReacted(_ completion: @escaping (MisskeyAPIKit.Note.Reacted) -> Void) -> Self {
        onReacted = completion
        return self
    }

    var onUnreacted: ((MisskeyAPIKit.Note.Reacted) -> Void)?
    public func onUnreacted(_ completion: @escaping (MisskeyAPIKit.Note.Reacted) -> Void) -> Self {
        onUnreacted = completion
        return self
    }

    var onPollVoted: ((MisskeyAPIKit.Note.Poll.Voted) -> Void)?
    public func onPollVoted(_ completion: @escaping (MisskeyAPIKit.Note.Poll.Voted) -> Void) -> Self {
        onPollVoted = completion
        return self
    }

    var onDeleted: ((MisskeyAPIKit.Note.Deleted) -> Void)?
    public func onDeleted(_ completion: @escaping (MisskeyAPIKit.Note.Deleted) -> Void) -> Self {
        onDeleted = completion
        return self
    }
}