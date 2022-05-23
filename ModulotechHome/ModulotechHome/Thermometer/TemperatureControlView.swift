//
//  TemperatureControlView.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

struct TemperatureControlView : View {
    @Binding var temperatureValue: CGFloat
    @State var angleValue: CGFloat = 0.0
    let minimumValue: CGFloat = 15.0
    let maximumValue: CGFloat = 40.0
    let totalValue: CGFloat = 100.0
    let knobRadius: CGFloat = 10.0
    let radius: CGFloat = 125.0
    
    var body: some View {
        ZStack {
            OuterBorderCircle()
            
            Circle()
                .trim(from: minimumValue/totalValue, to: maximumValue/totalValue)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [Color.green, Color.yellow, Color.red]),
                        center: .center,
                        startAngle: .degrees(50),
                        endAngle: .degrees(150)),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .frame(width: radius * 2, height: radius * 2)
                .rotationEffect(.degrees(-190))
            
            Group {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 15, height: 15)
                    .rotationEffect(.degrees(45))
                    .offset(y: -80)
                    .rotationEffect(Angle.degrees(Double(angleValue)))
                
                KnobCircle(radius: knobRadius * 2, padding: 6)
                    .offset(y: -radius)
                    .rotationEffect(Angle.degrees(Double(angleValue)))
                    .gesture(DragGesture(minimumDistance: 0.0)
                                .onChanged({ value in
                        change(location: value.location)
                                }))
            }
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -3, y: 2)
            .rotationEffect(.degrees(-100))
            
            KnobCircle(radius: 160, padding: 10)
            
            InnerCircle()
        }
        .onAppear {
            updateInitialValue()
        }
    }
    
    private func updateInitialValue() {
        temperatureValue = minimumValue
        angleValue = CGFloat(temperatureValue/totalValue) * 360
    }
    
    private func change(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: location.y)
        let angle = atan2(vector.dy - knobRadius, vector.dx - knobRadius) + .pi/2.0
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        let value = fixedAngle / (2.0 * .pi) * totalValue
        
        if value >= minimumValue && value <= maximumValue {
            temperatureValue = value
            angleValue = fixedAngle * 180 / .pi
        }
    }
}

struct OuterBorderCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(white: 0.9), lineWidth: 1)
                .frame(width: 250, height: 250)
            Circle()
                .stroke(LinearGradient(
                    gradient: Gradient(
                        stops: [Gradient.Stop(color: Color(white: 0.9), location: 0.0),     Gradient.Stop(color: Color(white: 0.92), location: 0.5),
                                Gradient.Stop(color: Color(white: 0.92), location: 1.0)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom),
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: CGLineCap.butt,
                            dash: [2, 8]))
                .frame(width: 210, height: 210)
        }
    }
}

struct InnerCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(ColorConstants.grayCircle)
                .frame(width: 40, height: 40)
            Circle()
                .fill(ColorConstants.greenCircle)
                .frame(width: 15, height: 15)
        }
    }
}

struct KnobCircle: View {
    let radius: CGFloat
    let padding: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.init(white: 0.96))
                .frame(width: radius, height: radius)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: -10, y: 8)
            Circle()
                .fill(Color.white)
                .frame(width: radius - padding, height: radius - padding)
        }
    }
}

struct SliderKnob: View {
    let color: Color
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 30, height: 30)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: -2.0, y: 3.0)
            Circle()
                .fill(ColorConstants.grayCircle)
                .frame(width: 15, height: 15)
            Circle()
                .fill(color)
                .frame(width: 100, height: 10)
        }
    }
}
