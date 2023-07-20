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
    var params: [String: Any?]? { get }
}
