//
//  NotesClient.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/11.
//

import Alamofire

public struct NotesRequest: BaseRequest {
    enum Endpoint: String {
        case localTimeline = "local-timeline"
        case globalTimeline = "global-timeline"
        case create
        case delete
    }

    public let endpoint: String
    public let params: [String: Any?]?

    init(endpoint: Endpoint, params: [String: Any?]? = nil) {
        self.endpoint = "notes/" + endpoint.rawValue
        self.params = params
    }
}

public class NotesClient: BaseClient<[Note], NotesRequest> {}
