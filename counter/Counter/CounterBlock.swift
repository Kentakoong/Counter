//
//  CounterBlock.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import SwiftUI

struct CounterBlock: View {
    @Binding var value: CounterValue
    @Binding var winner: WinState?
    @Binding var winScore: Int?
    @State private var isLongPress = false
    
    var setWin: (_ value: CounterValue) -> Void
    var checkDeal: (_ winScore: Int) -> Void
    
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
            if(self.isLongPress) {
                isLongPress = false
                return
            }
            value.score += 1
            checkDeal(winScore!)
            if((winScore != nil) && value.score >= winScore!) {
                setWin(value)
                return
            }
        }, label: {
            Text("\(value.score)")
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(value.bgColor)
                .foregroundColor(calcColor())
        }).disabled((winner != nil) ? true : false)
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 0.25).onEnded({_ in
                    isLongPress = true
                    if value.score > 0 {
                        value.score -= 1
                    }
                })
            )
    }
}

struct CounterBlock_Previews: PreviewProvider {
    static var previews: some View {
        CounterBlock(value: .constant(defaultCounter[0]),
                     winner: .constant(WinState(player: 1, color: Color.white)),
                     winScore: .constant(13),
                     setWin: {_ in print("setWin")}, checkDeal: {_ in print("checkDeal")})
    }
}
