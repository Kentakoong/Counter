//
//  ContentView.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import SwiftUI

struct ContentView: View {
//    @State var isSave = true
    @State var showSettings = false
    @State var opacity: Double = 0
    @State var CounterData = defaultCounter
    
    var body: some View {
        ZStack {
            AStack(spacing: 0) {
                CounterBlock(value: $CounterData[0])
                CounterBlock(value: $CounterData[1])
            }
            Settings(
//                isSave: $isSave,
                data: $CounterData)
                .opacity(opacity)
            Toolbar(showSettings: $showSettings, opacity: $opacity, data: $CounterData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
