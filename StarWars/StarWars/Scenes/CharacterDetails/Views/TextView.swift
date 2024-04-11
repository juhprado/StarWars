//
//  TextView.swift
//  StarWars
//
//  Created by Juliana Prado on 11/04/24.
//

import Foundation
import SwiftUI

struct TextView: View {

    var label: String
    var value: String
    
    var body: some View {
            HStack {
                Text(label)
                    .bold()
                Spacer()
                Text(value)
            }
        

    }

}
