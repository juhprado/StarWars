//
//  CharacterListView.swift
//  StarWars
//
//  Created by Juliana Prado on 10/04/24.
//

import Foundation
import SwiftUI

struct CharacterListView: View {
    
    @ObservedObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationSplitView {
            List($viewModel.characters, id: \Person.id) { $person in
                NavigationLink {
                    CharacterDetailsView(person: person)
                } label: {
                    Text("\(String(describing: person.name ?? ""))")
                        .foregroundColor(.yellow)
                }
            }
//            ProgressView()
//                .progressViewStyle(.circular)
//                .toggleIsHidden($viewModel.shouldStopPagination)
//                .onAppear {
//                    self.viewModel.fetchMoreCharacters()
//                }
            .navigationTitle("Characters")
            .preferredColorScheme(.dark)
        } detail: {
            Text("Select a Character")
        } .onAppear {
            viewModel.fetchCharacters()
        }
    }
    
}
