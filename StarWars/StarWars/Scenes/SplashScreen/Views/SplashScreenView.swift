//
//  SplashScreenView.swift
//  StarWars
//
//  Created by Juliana Prado on 11/04/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @StateObject private var viewModel = SplashScreenViewModel()
    @State private var isBlinking = true
    
    init(){
            UINavigationBar.setAnimationsEnabled(false)
        }
    
    var body: some View {
        NavigationView {
            NavigationLink(isActive: $viewModel.pushNewView) {
                CharacterListView().navigationBarBackButtonHidden()
            } label: {
                ZStack(alignment: .center) {
                    Color.black.ignoresSafeArea()
                    Image("starWars")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: isBlinking ? 100 : 90, height: isBlinking ? 100 : 90, alignment: .center)
                        .scaleEffect(isBlinking ? 1 : 1.3)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true)
                        )
                        .padding(.bottom, 30)
                        .onAppear {
                            isBlinking.toggle()
                        }
                }
            }
        }
        .onAppear {
            viewModel.pushToNewView()
        }
    }
    
}
