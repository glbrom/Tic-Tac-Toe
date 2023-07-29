//
//  SplashScreenView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 18.07.2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.2
    @State private var opacity = 0.1
    @State private var rotation = 30
    
    var body: some View {
        
        if isActive {
            GameView()
        } else {
            ZStack {
                VStack {
                    VStack {
                        Image("BackgroundImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 1200, height: 1300)
                            .clipped()
                            .blur(radius: 15)
                    }
                }
                VStack {
                    Image("LogoApp")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(10))
                        .clipped()
                        .padding(220)
                    // Animation LogoApp
                        .scaleEffect(size)
                        .opacity(opacity)
                        .rotationEffect(.degrees(Double(rotation)))
                        .onAppear() {
                            withAnimation(.easeIn(duration: 1)) {
                                self.size = 1
                                self.opacity = 1
                                self.rotation = 160
                            }
                        }
                    Text("Created by Roman Golub")
                        .font(Font.system(size: 20))
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.yellow)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
