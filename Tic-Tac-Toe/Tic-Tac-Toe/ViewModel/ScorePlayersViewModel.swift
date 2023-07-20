//
//  ScorePlayersViewModel.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

final class ScoreViewPlayersModel: ObservableObject {
    
    static let shared = ScoreViewPlayersModel()
    
    @Published var winsPlayerOne: Int = 0
    @Published var winsPlayerTwo: Int = 0
    @Published var drawsPlayer: Int = 0
    
    func increseWinScorePlayerOne() {
        winsPlayerOne += 1
    }
    
    func increseWinScorePlayerTwo() {
        winsPlayerTwo += 1
    }
    
    func increseDrawScorePlayers() {
        drawsPlayer += 1
    }
    
    func resetScorePlayers() {
        winsPlayerOne = 0
        winsPlayerTwo = 0
        drawsPlayer = 0
    }
}

