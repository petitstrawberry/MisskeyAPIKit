//
//  Notes+Create.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/19.
//

public extension NotesRequest {
    struct CreateRequest: BaseRequest {
        public let endpoint: String = "notes/create"
        public let params: [String: Any?]?

        public init(
            visibility: Note.Visibility? = nil,
            visibleUserIds: [String]? = nil,
            cw: String? = nil,
            localOnly: Bool? = nil,
            reactionAcceptance: Bool? = nil,
            noExtractMentions: Bool? = nil,
            noExtractHashtags: Bool? = nil,
            noExtractEmojis: Bool? = nil,
            replyId: String? = nil,
            renoteId: String? = nil,
            channelId: String? = nil,
            text: String,
            fileIds: [String]? = nil,
            mediaIds: [String]? = nil,
            poll: Note.Poll? = nil
        ) {
            params = [
                "visibility": visibility?.rawValue,
                "visibleUserIds": visibleUserIds,
                "cw": cw,
                "localOnly": localOnly,
                "reactionAcceptance": reactionAcceptance,
                "noExtractMentions": noExtractMentions,
                "noExtractHashtags": noExtractHashtags,
                "noExtractEmojis": noExtractEmojis,
                "replyId": replyId,
                "renoteId": renoteId,
                "channelId": channelId,
                "text": text,
                "fileIds": fileIds,
                "mediaIds": mediaIds,
                "poll": poll,
            ]
        }
    }
}

public extension NotesResponse {
    struct CreateResponse: Codable {
        let createdNote: Note
    }
}

public extension NotesClient {
    /// Create note
    /// - Parameters:
    ///  - request: CreateRequest
    /// - Returns: Created note
    /// - Throws: APIError, Error
    ///
    func create(_ request: NotesRequest.CreateRequest) async throws -> Note {
        return try (await super.request(request) as NotesResponse.CreateResponse).createdNote
    }
}
