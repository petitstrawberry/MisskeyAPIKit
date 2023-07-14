//
//  APIError.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/15.
//

import Alamofire

enum APIError: Error {
    case badRequest(ErrorResponse.Error)
    case unauthorized(ErrorResponse.Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case alamofireError(AFError)
    case unknown
}

struct ErrorResponse: Codable {
    struct Error: Codable {
        let message: String
        let code: String
        let id: String
        let kind: String
        let info: Info?
    }

    struct Info: Codable {
        let param: String?
        let reason: String?
    }

    let error: Error
}
