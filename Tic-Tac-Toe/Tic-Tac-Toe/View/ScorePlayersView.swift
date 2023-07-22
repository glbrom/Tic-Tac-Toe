//
//  ScorePlayersView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

struct ScorePlayersView: View {
    
    @StateObject var viewModel = ScoreViewPlayersModel.shared
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 120)
                .foregroundColor(Color("PrimaryBackground"))
                .opacity(0.3)
                .cornerRadius(16)
                .padding(10)
            Score
                .frame(width: 250, height: 200)
        }
    }
    
    var Score: some View {
        
        VStack(spacing: 2) {
            HStack {
                // X count
                Text("\(Image(systemName: "xmark"))")
                    .foregroundColor(Color("Color_X"))
                    .font(.custom("Poppins Bold", size: 30, relativeTo: .title))
                    .padding(.leading, 20)
                Text(": \(viewModel.winsPlayerOne)")
                    .foregroundColor(.white)
                    .font(.custom("Poppins Bold", size: 30, relativeTo: .title))

                Spacer()
                // Draws count
                Text("\(viewModel.drawsPlayer)")
                    .foregroundColor(.white)
                    .font(.custom("Poppins Bold", size: 28, relativeTo: .title))
                Spacer()
                
                // 0 count
                Text("\(viewModel.winsPlayerTwo) :")
                    .foregroundColor(.white)
                    .font(.custom("Poppins Bold", size: 30, relativeTo: .title))

                Text("\(Image(systemName: "circle"))")
                    .foregroundColor(Color("Color_O"))
                    .font(.custom("Poppins Bold", size: 30 , relativeTo: .title))
                    .padding(.trailing, 20)
            }
            // Reset button
            Button {
                ScoreViewPlayersModel.shared.resetScorePlayers()
            } label: {
                Text("Reset Score")
                    .foregroundColor(.orange)
                    .font(.custom("Poppins Bold", size: 20 , relativeTo: .title))
                    .frame(width: 150, height: 50)
            }
        }
    }
}

struct ScorePlayersView_Previews: PreviewProvider {
    static var previews: some View {
        ScorePlayersView(viewModel: ScoreViewPlayersModel.shared)
    }
}

