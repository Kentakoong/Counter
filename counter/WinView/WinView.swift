//
//  WinView.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/21/22.
//

import SwiftUI

struct WinView: View {
    @Binding var winner: WinState?
    var reset: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            Text("Player")
                .font(.system(size: 35))
            Circle()
                .fill(winner?.color ?? Color.black)
                .shadow(radius: 2)
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .frame(maxWidth: 50, maxHeight: 50)
            Text("Wins")
                .font(.system(size: 35))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.regularMaterial)
        .onTapGesture {
            winner = nil
            reset()
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(winner: .constant(WinState(player: 1, color: Color.blue)), reset: Counter().reset)
    }
}
