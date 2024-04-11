//
//  NetworkError.swift
//  StarWars
//
//  Created by Juliana Prado on 10/04/24.
//

import Foundation

enum NetworkError: Error {
    case networkError(error: String)
    case invalidResponse(error: String)
    case invalidURL(error: String)
}
