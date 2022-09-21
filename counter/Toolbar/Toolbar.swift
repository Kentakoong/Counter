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
    @Binding var settings: SettingsData
    
    func resetScore() {
        data = defaultCounter
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                resetScore()
            }, label: {
                Text("Reset")
                    .padding()
                    .frame(maxHeight: 40)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
            })
            Button(action: {
                settings.showSettings.toggle()
                withAnimation(.easeInOut(duration: 0.1)) {
                    if(opacity == 0) {
                        opacity = 1
                        return
                    }
                    opacity = 0
                }
            }, label: {
                Image(systemName:
                        settings.showSettings ? "xmark" : "gearshape.fill")
                .resizable()
                .foregroundColor(Color.black)
                .padding(!settings.showSettings ? 8 : 10)
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
        Toolbar(opacity: .constant(0), data: .constant(defaultCounter), settings: .constant(SettingsData()))
    }
}
