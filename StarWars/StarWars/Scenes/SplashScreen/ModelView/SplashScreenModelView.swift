//
//  SplashScreenModelView.swift
//  StarWars
//
//  Created by Juliana Prado on 11/04/24.
//

import Foundation

/// Splash Screen View Model
final class SplashScreenViewModel: ObservableObject {
    
    @Published var pushNewView: Bool = false
    
    func pushToNewView() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.pushNewView = true
        }
    }
}
