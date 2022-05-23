//
//  ShutterSlider.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

struct ShutterSlider: Shape {
    var progress: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        let progressHeight = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: 0))
        let controlPoint1 = CGPoint(x: -28, y: progressHeight - 20)
        let controlPoint2 = CGPoint(x: 0, y: progressHeight - 20)
        
        let controlPoint3 = CGPoint(x: -20, y: progressHeight + 20)
        let controlPoint4 = CGPoint(x: -0, y: progressHeight + 25)
        
        if progressHeight > 60 {
            path.addLine(to: CGPoint(x: 0, y: progressHeight - 60))
        }
        
        path.addCurve(to: CGPoint(x: -25, y: progressHeight), control1: controlPoint2, control2: controlPoint1)
        
        if (progressHeight < height - 60) {
            path.addCurve(to: CGPoint(x: 0, y: progressHeight + 60), control1: controlPoint3, control2: controlPoint4)
        }
        
        path.addLine(to: CGPoint(x: 0, y: height))
        return path
    }
}
