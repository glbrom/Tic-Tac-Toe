//
//  PlayWithFriendsModel.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import Foundation

struct PlayWithFriendsModel {
    enum Player {
        case playerOne, playerTwo
    }
    
    struct Move {
        let player: Player
        let boardIndex: Int
        
        var indicator: String {
            return player == .playerOne ? "xmark" : "circle"
        }
    }
}
