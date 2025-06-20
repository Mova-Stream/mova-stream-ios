//
//  MetfoneESimBaseResponse.swift
//  mocha
//
//  Created by ALTEK DT on 15/5/25.
//  Copyright © 2025 TTND. All rights reserved.
//

import Foundation

struct MetfoneESimBaseResponse<T: Codable>: Codable {
    let errorCode: String?
    let errorMessage: String?
    let result: MetfoneESimBaseResultResponse<T>?
}

struct MetfoneESimBaseResultResponse<T: Codable>: Codable {
    var errorCode: String?
    var message: String?
    var object: String?
    var userMsg: String?
    var wsResponse: T?
}
