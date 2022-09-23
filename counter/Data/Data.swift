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
    @Published var dealAvailable: Bool
    
    init() {
        CounterData = defaultCounter
        dealAvailable = false
    }
    
    func reset() {
        CounterData = defaultCounter
    }
    
    func checkDeal(winScore: Int?) {
        let scores = Dictionary(grouping: CounterData.filter({$0.score >= 10}), by: \.score)
        let duplicates = scores.filter { $1.count > 1 }
        if(duplicates.isEmpty ||
           ((winScore != nil) && duplicates.keys.first != winScore! - 1)
        ) { return dealAvailable = false }
        dealAvailable = true
    }
    
}

struct WinState {
    @State var player: Int
    @State var color: Color
}

class SettingsData: ObservableObject {
    var showSettings = false
    var winner: WinState?
    var winScore: Int?
    @AppStorage("pingPongMode") var pingPongMode = false
    
    init() {
        if(pingPongMode) { winScore = 11 }
    }
    
    func setPingPongMode() {
        if(pingPongMode == true) { return winScore = 11 }
        winScore = nil
    }
    
    func addDeal() {
        if(winScore != nil) { winScore = winScore! + 2 }
    }
    
    func setWinState(value: CounterValue) {
        self.winner = WinState(player: value.id + 1, color: value.bgColor)
    }
}


