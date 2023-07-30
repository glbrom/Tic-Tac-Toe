//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

struct GameView: View {
    
    var body: some View {
       
        NavigationView {
            
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 1000, height: 1200, alignment: .leading)
                    .clipped()
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    
                    Spacer()
                    
                    Text("Tic Tac Toe")
                        .font(.custom("Poppins Bold", size: 42, relativeTo: .title))
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("CustomYellow"))
                        .padding(10)
                    
                    Text("A Classic Game")
                        .font(.custom("Poppins Bold", size: 22))
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    NavigationLink(destination: PlayWithFriendsView()) {
                        Text("Double Player ")
                            .font(.custom("Poppins Bold", size: 20))
                            .fontWeight(.light)
                            .foregroundColor(Color("CustomYellow"))
                            .multilineTextAlignment(.center)
                            .frame(width: 180, height: 10)
                            .padding()
                            .background(Color("BlurBackground"))
                            .cornerRadius(8)
                    }
                    .padding(8)
                    
                    NavigationLink(destination: PlayWithAIView()) {
                        Text("Single Player")
                            .font(.custom("Poppins Bold", size: 20))
                            .fontWeight(.light)
                            .foregroundColor(Color("CustomYellow"))
                            .multilineTextAlignment(.center)
                            .frame(width: 180, height: 10)
                            .padding()
                            .background(Color("BlurBackground"))
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                }
                
            }
        }
        .accentColor(Color(.orange))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
