//
//  Toolbar.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import SwiftUI

struct Toolbar: View {
    @Binding var opacity: Double
    @Binding var data: [CounterValue]
    @Binding var showSettings: Bool
    @Binding var dealAvailable: Bool
    @Binding var pingPongMode: Bool
    
    var addDeal: () -> Void
    
    func resetScore() {
        data = defaultCounter
    }
    
    var body: some View {
        HStack(spacing: 15) {
            if(dealAvailable && pingPongMode) {
                Button(action: {
                    addDeal()
                    dealAvailable = false
                    print(dealAvailable)
                }, label: {
                    Text("Deal!")
                        .padding()
                        .frame(maxHeight: 40)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                })
            }
            Button(action: resetScore, label: {
                Text("Reset")
                    .padding()
                    .frame(maxHeight: 40)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
            })
            Button(action: {
                showSettings.toggle()
                withAnimation(.easeInOut(duration: 0.1)) {
                    if(opacity == 0) {
                        opacity = 1
                        return
                    }
                    opacity = 0
                }
            }, label: {
                Image(systemName:
                        showSettings ? "xmark" : "gearshape.fill")
                .resizable()
                .foregroundColor(Color.black)
                .padding(!showSettings ? 8 : 10)
                .background(Color.white)
                .frame(maxWidth: 40, maxHeight: 40)
                .clipShape(Circle())
                .shadow(radius: 5)
            })
        }
        .padding(20)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar(opacity: .constant(0), data: .constant(defaultCounter), showSettings: .constant(true), dealAvailable: .constant(true), pingPongMode: .constant(true), addDeal: {print("addDeal")})
    }
}
