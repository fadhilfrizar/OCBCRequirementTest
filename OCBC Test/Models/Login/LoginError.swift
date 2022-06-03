//
//  LoginError.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

enum LoginError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case unprocessableEntity
    case internalServerError
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel:
            return ""
        case .invalidRequestURLString:
            return "invalidRequestURLString"
        case .badRequest:
            return "badRequest"
        case .unauthorized:
            return "unauthorized"
        case .forbidden:
            return "forbidden"
        case .notFound:
            return "notFound"
        case .conflict:
            return "conflict"
        case .unprocessableEntity:
            return "unprocessableEntity"
        case .internalServerError:
            return "internalServerError"
        }
    }
    
}
