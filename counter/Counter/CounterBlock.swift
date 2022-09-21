//
//  CounterBlock.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import SwiftUI

struct CounterBlock: View {
    @Binding var value: CounterValue
    @Binding var settings: SettingsData
    
    func calcColor() -> Color {
        var gs: CGFloat = 0
        var ap: CGFloat = 0
        UIColor(value.bgColor).getWhite(&gs, alpha: &ap)
        if(gs <= 0.6) {
            return Color.white
        }
        return Color.black
    }
    
    var body: some View {
        Button(action: {
            value.score += 1
            if(settings.pingPongMode && value.score >= 11) {
                settings.setWinState(value: value)
                return
            }
        }, label: {
            Text("\(value.score)")
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(value.bgColor)
                .foregroundColor(calcColor())
        }).disabled((settings.winner != nil) ? true : false)
    }
}

struct CounterBlock_Previews: PreviewProvider {
    static var previews: some View {
        CounterBlock(value: .constant(CounterValue(id: 0, score: 0, bgColor: Color.red)), settings: .constant(SettingsData()))
    }
}
