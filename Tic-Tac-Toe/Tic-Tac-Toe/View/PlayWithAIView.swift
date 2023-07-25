//
//  PlayWithAIView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

struct PlayWithAIView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .gray
        UISegmentedControl.appearance().backgroundColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.systemYellow], for: .selected)
    }
    
    @StateObject private var viewModel = PlayWithAIViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            Image("BackgroundImage")
                .resizable()
                .scaledToFill()
                .frame(width: 1000, height: 1000, alignment: .center)
                .clipped()
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Choose the difficult: ")
                        .font(.title3)
                        .foregroundColor(.white)
                    Picker(selection: $viewModel.selectedLevelIndex, label: Text("")) {
                        ForEach(0..<viewModel.levels.count) {
                            Text(viewModel.levels[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                    .foregroundColor(Color("PrimaryBackground"))
                    .padding(8)
                    .disabled(viewModel.isGameStarted)
                    
                    HStack {
                        Spacer()
                        
                        ScoreAIView(viewModel: ScoreViewModel.shared)
                        
                        Button {
                            ScoreViewModel.shared.resetScore()
                        } label: {
                            Text(Image(systemName: "arrow.counterclockwise")
                            )
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 50)
                        }
                        Spacer()
                    }
                }
                .padding(.vertical, 8)
                
                ZStack {
                    Rectangle()
                        .frame(height: 386)
                        .foregroundColor(Color("BlurBackground"))
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
            .disabled(viewModel.isGameboardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
            }
        }
    }
}

struct PlayWithAIView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWithAIView()
    }
}

