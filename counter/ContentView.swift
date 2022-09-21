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
    @State var opacity: Double = 0
    @State var SettingsValue = SettingsData()
    
    var body: some View {
        ZStack {
            AStack(spacing: 0) {
                ForEach($CounterData.CounterData) { $ct in
                    CounterBlock(value: $ct, settings: $SettingsValue)
                }
            }
            Settings(
//                isSave: $isSave,
                settings: $SettingsValue, data: $CounterData.CounterData)
                .opacity(opacity)
            Toolbar(opacity: $opacity, data: $CounterData.CounterData, settings: $SettingsValue)
            if((SettingsValue.winner) != nil) {
                WinView(winner: $SettingsValue.winner, reset: CounterData.reset)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
