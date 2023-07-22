//
//  ScoreView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

struct ScoreAIView: View {
    
    @StateObject var viewModel = ScoreViewModel.shared
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 220, height: 110)
                .foregroundColor(Color("PrimaryBackground"))
                .opacity(0.3)
                .cornerRadius(16)
                .padding(10)
            Score
                .frame(width: 180, height: 180)
        }
    }
    
    var Score: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Wins:")
                    .foregroundColor(.black)
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
                Spacer()
                Text("\(viewModel.wins)")
                    .foregroundColor(.black)
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
            }
            HStack {
                Text("Losses:")
                    .foregroundColor(.black)
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
                Spacer()
                Text("\(viewModel.losses)")
                    .foregroundColor(.black)
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
            }
            HStack {
                Text("Draws:")
                    .foregroundColor(.black)
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
                Spacer()
                Text("\(viewModel.draws)")
                    .foregroundColor(.black)
                    .font(.custom("Poppins Bold", size: 24, relativeTo: .title))
            }
        }
        .colorInvert()
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreAIView(viewModel: ScoreViewModel.shared)
    }
}

