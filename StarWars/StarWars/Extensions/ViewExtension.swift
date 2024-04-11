//
//  ViewExtension.swift
//  StarWars
//
//  Created by Juliana Prado on 11/04/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func toggleIsHidden(_ isHidden: Binding<Bool>) -> some View {
        if isHidden.wrappedValue {
            self.hidden()
        } else {
            self
        }
    }
}
