//
//  StreamingResponse.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/10/18.
//

import Foundation

public struct StreamingResponse {

    public class Body {

        enum EventType: String {
            // localTimeline
            // hybridTimeline
            // homeTimeline
            // globalTimeline
            case note
            // main
            case notification
            case mention
            case reply
            case renote
            case follow
            case followed
            case unfollow
            // case messagingMessage
            case readAllNotifications
            case unreadNotification
            case unreadMention
            case readAllUnreadMentions
            case unreadSpecifiedNote
            case readAllUnreadSpecifiedNotes
            // case unreadMessagingMessage
            // case readAllMessagingMessages

            // Note Capture Event
            case reacted
            case unreacted
            case pollVoted
            case deleted
        }

        let id: String?
        let type: EventType?
        let body: [String: Any?]?

        init(id: String? = nil, type: EventType? = nil, body: [String: Any?]? = nil) {

            self.id = id
            self.type = type
            self.body = body
        }
    }

    let type: String
    let body: Body
}
