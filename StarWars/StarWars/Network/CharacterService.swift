//
//  CharacterService.swift
//  StarWars
//
//  Created by Juliana Prado on 10/04/24.
//

import Foundation
import Combine

protocol CharacterServiceProtocol {
    func fetchCharacterService(_ nextPage: String?) -> AnyPublisher<Characters,NetworkError>
}

struct CharacterService: HTTPClient, CharacterServiceProtocol{
    func fetchCharacterService(_ nextPage: String?) -> AnyPublisher<Characters,NetworkError> {
        if nextPage == nil {
            return fetch(CharacterEndpoint.get(path: "https://swapi.dev/api/people/"), defaultValue: Characters.self).eraseToAnyPublisher()
        } else {
            return fetch(CharacterEndpoint.get(path: nextPage ?? ""), defaultValue: Characters.self).eraseToAnyPublisher()
        }
        
    }
}
