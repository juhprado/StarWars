//
//  CharacterDetailsView.swift
//  StarWars
//
//  Created by Juliana Prado on 11/04/24.
//

import SwiftUI

struct CharacterDetailsView: View {

    var person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            TextView(label: "Name:", value: person.getName())
            TextView(label: "Mass:", value: person.getMass())
            TextView(label: "Height:", value: person.getHeight())
            TextView(label: "Birth Year:", value: person.getBirthYear())
            TextView(label: "Eye Color:", value: person.getEyeColor())
            TextView(label: "Hair Color:", value: person.getHairColor())
            TextView(label: "Skin Color:", value: person.getSkinColor())
        }
    }

}
