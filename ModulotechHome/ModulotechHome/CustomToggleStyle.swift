//
//  CustomToggleStyle.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    let onColor: Color
    let offColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
                    .frame(width: 80, height: 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                            .blur(radius: 3)
                            .offset(y: 2)
                            .mask(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.black, Color.clear]),
                                            startPoint: .top,
                                            endPoint: .bottom)
                                    )
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 4)
                            .blur(radius: 3)
                            .offset(y: -4)
                            .mask(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.clear, Color.black]),
                                            startPoint: .top,
                                            endPoint: .bottom)
                                    )
                            )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                RoundedRectangle(cornerRadius: 7)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 35, height: 14)
                    .offset(x: configuration.isOn ? 18 : -18)
                    .shadow(color: Color.black.opacity(0.15), radius: 2, x: -2, y: 2)
                    .onTapGesture {
                        withAnimation {
                            configuration.isOn.toggle()
                        }
                    }
            }
        }
    }
}
