//
//  PlayWithFriendsViewModel.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

final class PlayWithFriendsViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var isPlayerOneTurn: Bool = true
    
    @Published var moves: [PlayWithFriendsModel.Move?] = Array(repeating: nil, count: 9)
    @Published var alertItem: AlertItem?
    
    func processPlayerMove(for position: Int) {
        if isPlayerOneTurn {
            if isSquareOccupied(in: moves, forIndex: position) { return }
            moves[position] = PlayWithFriendsModel.Move(player: .playerOne, boardIndex: position)
            
            if checkWinCondition(for: .playerOne, in: moves) {
                ScoreViewPlayersModel.shared.increseWinScorePlayerOne()
                alertItem = AlertContext.playerOneWin
                return
            }
            
            if checkForDraw(in: moves) {
                ScoreViewPlayersModel.shared.increseDrawScorePlayers()
                alertItem = AlertContext.draw
                return
            }
            
            isPlayerOneTurn.toggle()
        } else {
            if isSquareOccupied(in: moves, forIndex: position) { return }
            moves[position] = PlayWithFriendsModel.Move(player: .playerTwo, boardIndex: position)
            
            if checkWinCondition(for: .playerTwo, in: moves) {
                ScoreViewPlayersModel.shared.increseWinScorePlayerTwo()
                alertItem = AlertContext.playerTwoWin
                return
            }
            
            if checkForDraw(in: moves) {
                ScoreViewPlayersModel.shared.increseDrawScorePlayers()
                alertItem = AlertContext.draw
                return
            }
            
            isPlayerOneTurn.toggle()
        }
    }
    
    func isSquareOccupied(in moves: [PlayWithFriendsModel.Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    func checkWinCondition(for player: PlayWithFriendsModel.Player, in moves: [PlayWithFriendsModel.Move?]) -> Bool {
        // Setting Win conditions
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player }
        let playerPositions = Set(playerMoves.map { $0.boardIndex })
        
        // If player move == a win condition, then win
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        
        return false
    }
    
    func checkForDraw(in moves: [PlayWithFriendsModel.Move?]) -> Bool {
        // If all squares occupied, then draw
        return moves.compactMap { $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}

