//
//  Data.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import Foundation
import SwiftUI

public struct CounterValue: Identifiable {
    public var id: Int
    var score: Int
    var bgColor: Color
}

public let defaultCounter = [
    CounterValue(id: 0, score: 0, bgColor: Color.red),
    CounterValue(id: 1, score: 0, bgColor: Color.blue)
]

class Counter: ObservableObject {
    @Published var CounterData: [CounterValue]
    
    init() {
        CounterData = defaultCounter
    }
    
    func reset() {
        CounterData = defaultCounter
    }
    
}

struct WinState {
    @State var player: Int
    @State var color: Color
}

struct SettingsData {
    @State var showSettings = false
    var winner: WinState?
    @AppStorage("pingPongMode") var pingPongMode = false
    
    mutating func setWinState(value: CounterValue) {
        self.winner = WinState(player: value.id + 1, color: value.bgColor)
    }
}


