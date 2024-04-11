//
//  Endpoint.swift
//  StarWars
//
//  Created by Juliana Prado on 10/04/24.
//

import Foundation

protocol Endpoint {
    var method: RequestType { get }
    var header: [String:String]? { get }
    var body: [String:String]? { get }
    var path: String { get }
}

enum CharacterEndpoint {
    case get(path: String)
}

extension CharacterEndpoint: Endpoint {
    
    var path: String {
        get {
            switch self {
            case .get(let path):
                return path
            }
        }
    }
    
    var method: RequestType {
        switch self {
        case .get:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .get:
            return [
                "Content-Type" : "application/json"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .get:
            return nil
        }
    }
    
}
