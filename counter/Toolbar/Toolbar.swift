//
//  Toolbar.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import SwiftUI

struct Toolbar: View {
    @Binding var showSettings: Bool
    @Binding var opacity: Double
    @Binding var data: [CounterValue]
    
    func resetScore() {
        data = defaultCounter
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                resetScore()
            }, label: {
                Text("Reset")
            })
            .padding()
            .frame(maxHeight: 40)
            .foregroundColor(Color.black)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
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
            })
            .frame(maxWidth: 40, maxHeight: 40)
            .clipShape(Circle())
            .shadow(radius: 5)
        }
        .padding(20)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar(showSettings: .constant(false), opacity: .constant(0), data: .constant(defaultCounter))
    }
}
