//
//  CharacterListViewModel.swift
//  StarWars
//
//  Created by Juliana Prado on 10/04/24.
//

import Foundation
import SwiftUI
import Combine

class CharacterListViewModel: ObservableObject, HTTPClient {
    
    private var requests = Set<AnyCancellable>()
    
    var characterService = CharacterService()
    @Published var characters = [Person]()
//    var nextPage = ""
    @Published var shouldStopPagination: Bool = false
    
    func fetchCharacters() {
        let characters = characterService.fetchCharacterService(nil)
        characters
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    print("failed to parse JSON")
                }
            }, receiveValue: { [weak self] results in
                self?.characters = results.results ?? []
//                self?.nextPage = results.next ?? ""
            }) .store(in: &requests)
    }
    
//    func fetchMoreCharacters() {
//        let characters = characterService.fetchCharacterService(nextPage)
//        print(nextPage)
//        characters
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] completion in
//                switch completion {
//                case .finished:
//                    self?.hidePagination()
//                case .failure:
//                    self?.hidePagination()
//                }
//            }, receiveValue: { [weak self] results in
//                self?.characters.append(contentsOf: results.results ?? [])
//                self?.nextPage = results.next ?? ""
//            }) .store(in: &requests)
//    }
//    
    /// Toggle Pagination Activity Indicator
    func hidePagination() {
        self.shouldStopPagination = true
    }
    
    
}
