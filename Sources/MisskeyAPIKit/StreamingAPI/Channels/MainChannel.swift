//
//  MainChannel.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/24.
//

import Foundation
import Starscream

public class MainChannel: BaseChannel {
    override public var channel: String { "main" }

    override func didReceive(body: StreamingResponse.Body) {
        switch body.type {
        case .notification:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let notification = try decoder.decode(MisskeyAPIKit.Notification.self, from: data)
                self.onReceiveNotification?(notification)
            } catch {
                print(error)
            }
        case .mention:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.self, from: data)
                self.onReceiveMention?(note)
            } catch {
                print(error)
            }
        case .reply:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.self, from: data)
                self.onReceiveReply?(note)
            } catch {
                print(error)
            }
        case .renote:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.self, from: data)
                self.onReceiveRenote?(note)
            } catch {
                print(error)
            }
        case .follow:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let user = try decoder.decode(MisskeyAPIKit.User.self, from: data)
                self.onReceiveFollow?(user)
            } catch {
                print(error)
            }
        case .followed:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let user = try decoder.decode(MisskeyAPIKit.User.self, from: data)
                self.onReceiveFollowed?(user)
            } catch {
                print(error)
            }
        case .unfollow:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let user = try decoder.decode(MisskeyAPIKit.User.self, from: data)
                self.onReceiveUnfollow?(user)
            } catch {
                print(error)
            }
        default:
            break
        }
    }

    var onReceiveNotification: ((Notification) -> Void)?
    @discardableResult
    public func onReceiveNotification(_ completion: @escaping (Notification) -> Void) -> Self {
        onReceiveNotification = completion
        return self
    }

    var onReceiveMention: ((Note) -> Void)?
    @discardableResult
    public func onReceiveMention(_ completion: @escaping (Note) -> Void) -> Self {
        onReceiveMention = completion
        return self
    }

    var onReceiveReply: ((Note) -> Void)?
    @discardableResult
    public func onReceiveReply(_ completion: @escaping (Note) -> Void) -> Self {
        onReceiveReply = completion
        return self
    }

    var onReceiveRenote: ((Note) -> Void)?
    @discardableResult
    public func onReceiveRenote(_ completion: @escaping (Note) -> Void) -> Self {
        onReceiveRenote = completion
        return self
    }

    var onReceiveFollow: ((User) -> Void)?
    @discardableResult
    public func onReceiveFollow(_ completion: @escaping (User) -> Void) -> Self {
        onReceiveFollow = completion
        return self
    }

    var onReceiveFollowed: ((User) -> Void)?
    @discardableResult
    public func onReceiveFollowed(_ completion: @escaping (User) -> Void) -> Self {
        onReceiveFollowed = completion
        return self
    }

    var onReceiveUnfollow: ((User) -> Void)?
    @discardableResult
    public func onReceiveUnfollow(_ completion: @escaping (User) -> Void) -> Self {
        onReceiveUnfollow = completion
        return self
    }
}