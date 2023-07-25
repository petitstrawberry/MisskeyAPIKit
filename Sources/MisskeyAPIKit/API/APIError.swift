//
//  APIError.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/15.
//

import Alamofire

public enum APIError: Error {
    case badRequest(ErrorResponse.Error)
    case unauthorized(ErrorResponse.Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case alamofireError(AFError)
    case unknown
}

public struct ErrorResponse: Codable {
    public struct Error: Codable {
        public let message: String
        public let code: String
        public let id: String
        public let kind: String
        public let info: Info?
    }

    public struct Info: Codable {
        let param: String?
        let reason: String?
    }

    let error: Error
}
