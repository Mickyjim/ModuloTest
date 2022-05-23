//
//  ShutterView.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

struct ShutterView : View {
    @State var progress: CGFloat = 0.4
    @State var knobPosition: CGFloat  = 0.0
    @State var status = true
    let height: CGFloat = 500
    var body: some View {
        VStack {
            Text("Shutters")
                .font(.largeTitle)
                .bold()
                .foregroundColor(ColorConstants.textColorPrimary)
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(Array(stride(from: 100, through: 0, by: -10)), id: \.self) { i in
                        Text("\(i) %")
                            .font(.title)
                            .bold()
                    }
                }
                
                VStack(alignment: .trailing, spacing: 7.9) {
                    ForEach(Array(stride(from: 100, through: 0, by: -2)), id: \.self) { i in
                        Rectangle()
                            .fill(i % 10 == 0 ? ColorConstants.rularDark : ColorConstants.rularLight)
                            .frame(width: i%10 == 0 ? 25 : 20, height: 2)
                            .offset(x: calculateDisplacement(index: i))
                    }
                }
                ShutterSlider(progress: progress)
                    .stroke(
                    RadialGradient(
                        gradient: Gradient(colors: [ColorConstants.waterSlider, ColorConstants.waterSlider.opacity(0.1)]),
                        center: .center,
                        startRadius: 5,
                        endRadius: 200),
                    lineWidth: 8)
                    .frame(width: 4, height: height)
                
                SliderKnob(color: ColorConstants.waterSlider)
                    .offset(x: -54, y: knobPosition)
                    .gesture(DragGesture(minimumDistance: 0.0)
                                .onChanged({ value in
                                    calculateProgress(yLocation: value.location.y)
                                }))
                    .onAppear {
                        calculateInitialThumbPosition()
                    }
                Spacer()
                
                VStack(alignment: .leading, spacing: 60) {
                    VStack(alignment: .leading) {
                        Text("Level")
                            .font(.system(size: 20, weight: Font.Weight.light))
                            .foregroundColor((ColorConstants.textColorSecondary))
                        Text("\(String.init(format: "%.0f", progress * 100))%")
                                .font(.system(size: 55, weight: Font.Weight.bold))
                                .foregroundColor(ColorConstants.textColorPrimary)
                                .fixedSize()
                                .frame(width: 80)
                    }
                }
            }
            .padding(.top, 20)
            .padding(.leading, 30)
        .padding(.trailing, 30)
        }
    }
    func calculateDisplacement(index: Int) -> CGFloat {
        let actualLevel = (1-progress) * 100
        
        let minRange = actualLevel - 9
        let maxRange = actualLevel + 9
        
        let range = minRange...maxRange
        
        if range.contains(CGFloat(index)) {
            var displacement = abs(actualLevel - CGFloat(index))
            
            if displacement == 0 {
                displacement = -25
            } else {
                displacement = -25 + (displacement * 2)
            }
            
            return displacement
        }
        
        return 0
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

struct ShutterView_Previews: PreviewProvider {
    static var previews: some View {
        ShutterView()
    }
}
