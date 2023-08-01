//
//  BaseRequest.swift
//  MisskeyAPIKit
//
//  Created by petitstrawberry on 2023/07/15.
//

import Alamofire
import Foundation

public protocol BaseRequest {
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var params: [String: Any?]? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

public extension BaseRequest {
    var method: HTTPMethod { .post }
    var params: [String: Any?]? { nil }
    var encoding: ParameterEncoding { JSONEncoding.default }
    var headers: HTTPHeaders? { [
        "Content-Type": "application/json",
    ] }
}
