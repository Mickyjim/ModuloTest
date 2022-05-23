//
//  LightView.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

struct LightView : View {
    @State var status = true
    @State var progress: CGFloat = 0.4
    @State var knobPosition: CGFloat = 0.0
    
    let height: CGFloat = 400
    var body: some View {
        VStack {
            Text("Lights")
                .font(.largeTitle)
                .bold()
                .foregroundColor(ColorConstants.textColorPrimary)
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 20, x: -10.0, y: 10.0)
                    
                    LightSlider(progress: progress)
                        .fill(ColorConstants.lightLinearGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                }
                .frame(width: 160, height: height)
                
                SliderKnob(color: ColorConstants.lightTab)
                    .offset(x: -20, y: knobPosition)
                    .gesture(DragGesture(minimumDistance: 0).onChanged({ value in
                        calculateProgress(yLocation: value.location.y)
                    }))
                    .onAppear {
                        calculateInitialThumbPosition()
                    }
                
                VStack(alignment: .leading, spacing: 17.3) {
                    ForEach(Array(stride(from: 100, through: 0, by: -10)), id: \.self) { i in
                        Text("\(i) %")
                        
                    }
                }
                .padding(.leading, 10)
                
                VStack(alignment: .trailing, spacing: 2.8) {
                    ForEach(Array(stride(from: 0, through: 100, by: 1)), id: \.self) { i in
                        Rectangle()
                            .fill(i % 10 == 0 ? ColorConstants.rularDark : ColorConstants.rularLight)
                            .frame(width: i%10 == 0 ? 16 : 10, height: 1)
                        
                    }
                }
                .padding(.leading, 10)
            }
            
            HStack {
                Toggle(isOn: $status, label: {
                    Text("Auto adjust")
                        .font(.system(size: 11, weight: Font.Weight.light))
                })
                    .toggleStyle(CustomToggleStyle(onColor: ColorConstants.lightSwitch, offColor: ColorConstants.waterSwitch))
                Spacer()
                
                Text("\(String.init(format: "%.0f", (progress * 100))) %")
                    .font(.system(size: 50, weight: Font.Weight.light, design: Font.Design.rounded))
            }
            .padding(.leading, 40)
            .padding(.trailing, 40)
        }
    }
    private func calculateInitialThumbPosition() {
        let progressFromMiddle = 0.5 - progress
        knobPosition = progressFromMiddle * height
    }
    
    private func calculateProgress(yLocation: CGFloat) {
        let tempProgress = 0.5 - (yLocation - 20)/height
        if tempProgress >= 0 && tempProgress <= 1.0 {
            progress = tempProgress
            let progressFromMiddle = 0.5 - progress
            knobPosition = progressFromMiddle * height
        }
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView()
    }
}
