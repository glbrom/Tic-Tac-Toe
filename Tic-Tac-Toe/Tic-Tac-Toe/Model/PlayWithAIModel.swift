//
//  PlayWithAIModel.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import Foundation

struct PlayWithAIModel {
    enum Player {
        case human, computer
    }
    
    struct Move {
        let player: Player
        let boardIndex: Int
        
        var indicator: String {
            return player == .human ? "xmark" : "circle"
        }
    }
}
