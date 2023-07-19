//
//  PlayWithFriendsView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

struct PlayWithFriendsView: View {
    @StateObject private var viewModel = PlayWithFriendsViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            Image("BackgroundImage")
                .resizable()
                .scaledToFill()
                .frame(width: 1100, height: 900, alignment: .leading)
                .clipped()
                .ignoresSafeArea()
            VStack {
                Spacer()
                ScorePlayersView(viewModel: ScoreViewPlayersModel.shared)
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(height: 386)
                        .background(.ultraThinMaterial)
                        .cornerRadius(16)
                        .padding(-8)
                    LazyVGrid(columns: viewModel.columns, spacing: 10) {
                        ForEach(0..<9) { i in
                            ZStack {
                                GameSquareView(proxy: geometry, color: Color("PrimaryBackground"))
                                
                                PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                            }
                            .onTapGesture {
                                viewModel.processPlayerMove(for: i)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
            }
        }
    }
}

struct PlayWithFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWithFriendsView()
    }
}
