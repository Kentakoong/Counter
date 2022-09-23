//
//  Settings.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import SwiftUI

struct Settings: View {
//    @Binding var isSave: Bool
    @Binding var pingPongMode: Bool
    @Binding var data: [CounterValue]
    @Binding var winScore: Int?
    
    var setPingPongMode: () -> Void
    var checkDeal: (_ winScore: Int) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
//            Toggle(isOn: $isSave, label: {
//                Text("Save Score")
//            })
            Toggle(isOn: self.$pingPongMode, label: {
                Text("Ping Pong Mode")
            }).onChange(of: pingPongMode) { _ in
                setPingPongMode()
                checkDeal(winScore!)
                
            }
            ColorPicker(selection: $data[0].bgColor, supportsOpacity: false, label: {
                Text("First Player Color")
            })
            ColorPicker(selection: $data[1].bgColor, supportsOpacity: false, label: {
                Text("Second Player Color")
            })
        }
        .padding(
            EdgeInsets(top: 0, leading: 20, bottom: 80, trailing: 20)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.regularMaterial)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(
//            isSave: .constant(true),
            pingPongMode: .constant(true), data: .constant(defaultCounter), winScore: .constant(0), setPingPongMode: { print("Test") }, checkDeal: { _ in print("Hello") })
    }
}
