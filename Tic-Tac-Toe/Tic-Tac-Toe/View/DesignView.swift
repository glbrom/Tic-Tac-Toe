//
//  DesignView.swift
//  Tic-Tac-Toe
//
//  Created by Macbook on 15.07.2023.
//

import SwiftUI

struct GameSquareView: View {
    var proxy: GeometryProxy
    var color: Color?
    
    var body: some View {
        Rectangle()
            .foregroundColor(color!.opacity(0.9))
            .cornerRadius(16)
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(systemImageName == "xmark" ? Color("Color_X") : Color("Color_O"))
    }
}
