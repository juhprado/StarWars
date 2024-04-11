//
//  HTTPClient.swift
//  StarWars
//
//  Created by Juliana Prado on 10/04/24.
//

import Foundation
import Combine

protocol HTTPClient {
    func fetch<T: Decodable>(_ endpoint: Endpoint, defaultValue: T.Type) -> AnyPublisher<T,NetworkError>
}

extension HTTPClient {
    
    func fetch<T: Decodable>(_ endpoint: Endpoint, defaultValue: T.Type) -> AnyPublisher<T,NetworkError> {
        guard let url = URL(string: endpoint.path) else {
            return Fail(error: NetworkError.invalidURL(error: "Invalid URL")).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = endpoint.header
        
        let decoder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .mapError({ error -> NetworkError in
                switch error {
                case URLError.badServerResponse:
                    NetworkError.networkError(error: error.localizedDescription)
                case URLError.badURL:
                    NetworkError.invalidURL(error: error.localizedDescription)
                default:
                    NetworkError.invalidResponse(error: error.localizedDescription)
                }
            })
            .eraseToAnyPublisher()
    }
    
//    func fetch<T: Decodable>(endpoint: Endpoint, model: T.Type) async -> AnyPublisher<T, RequestError> {
//        var urlComponents = URLComponents()
//        urlComponents.path = endpoint.path
//        
//        guard let url = urlComponents.url else {
//            return .failure(.invalidURL)
//        }
//        
//        let request = URLRequest(url: url)
//        
//        do {
//            let (data, response) = try await URLSession.shared.data(for: request)
//            
//            guard let response = response as? HTTPURLResponse else {
//                return .failure(.invalidResponse)
//            }
//            
//            switch response.statusCode {
//            case 200...250:
//                guard let decodeResponse = try? JSONDecoder().decode(model, from: data) else {
//                    return .failure(.parsing)
//                }
//                return .success(decodeResponse)
//            case 400...500:
//                return .failure(.invalidResponse)
//            default:
//                return .failure(.invalidResponse)
//            }
//            
//        } catch {
//            return .failure(.invalidURL)
//        }
//    }
}
