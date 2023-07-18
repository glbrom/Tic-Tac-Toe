//
//  AlertsView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    
    static let playerOneWin = AlertItem(title: Text("Player One Win!"), message: Text("Was a great game! Player One was the best."), buttonTitle: Text("Rematch"))
    
    static let playerTwoWin = AlertItem(title: Text("Player Two Win!"), message: Text("Was a great game! Player Two was the best."), buttonTitle: Text("Rematch"))
    
    static let humanWin = AlertItem(title: Text("You Win!"), message: Text("You are so smart. You beat the AI."), buttonTitle: Text("Oh yeah"))
    
    static let computerWin = AlertItem(title: Text("You Lost!"), message: Text("The AI is very smart, don't worry, try again"), buttonTitle: Text("Rematch"))
    
    static let draw = AlertItem(title: Text("Draw!"), message: Text("What a battle! You fought well."), buttonTitle: Text("Try again"))
}
