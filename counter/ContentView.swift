//
//  ContentView.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import SwiftUI

struct ContentView: View {
//    @State var isSave = true
    @ObservedObject var CounterData = Counter()
    @ObservedObject var SettingsValue = SettingsData()
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack {
            AStack(spacing: 0) {
                ForEach($CounterData.CounterData) { $ct in
                    CounterBlock(value: $ct, winner: $SettingsValue.winner, winScore: $SettingsValue.winScore, setWin: SettingsValue.setWinState(value:), checkDeal: CounterData.checkDeal(winScore:))
                }
            }
            Settings(
//                isSave: $isSave,
                pingPongMode: SettingsValue.$pingPongMode, data: $CounterData.CounterData, winScore: $SettingsValue.winScore, setPingPongMode: SettingsValue.setPingPongMode, checkDeal: CounterData.checkDeal(winScore:))
                .opacity(opacity)
            Toolbar(opacity: $opacity, data: $CounterData.CounterData, showSettings: $SettingsValue.showSettings, dealAvailable: $CounterData.dealAvailable, pingPongMode: $SettingsValue.pingPongMode, addDeal: SettingsValue.addDeal)
            if((SettingsValue.winner) != nil) {
                WinView(winner: $SettingsValue.winner, winScore: $SettingsValue.winScore, reset: CounterData.reset)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
