//
//  ColorConstants.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

struct ColorConstants {
    static let background = Color(red: 239/255, green: 241/255, blue: 245/255)
    
    static let tempLow = Color(red: 152/255, green: 253/255, blue: 61/255)
    static let tempHigh = Color(red: 251/255, green: 152/255, blue: 151/255)
    static let greenCircle = Color(red: 168/255, green: 226/255, blue: 93/255)
    static let grayCircle = Color(red: 239/255, green: 241/255, blue: 245/255)
    static let knobBackground = Color(red: 246/255, green: 247/255, blue: 249/255)
    static let tempBackground = Color(red: 62/255, green: 187/255, blue: 0/255)
    
    static let textColorPrimary = Color(red: 69/255, green: 74/255, blue: 86/255)
    static let textColorSecondary = Color(red: 180/255, green: 183/255, blue: 189/255)
    
    static let tabBackground = Color(red: 59/255, green: 60/255, blue: 79/255)
    
    static let rularLight = Color(red: 220/255, green: 232/255, blue: 251/255)
    static let rularDark = Color(red: 160/255, green: 213/255, blue: 255/255)
    static let lightSwitch = Color(red: 234/255, green: 243/255, blue: 74/255)
    static let lightSliderStart = Color(red: 225/255, green: 228/255, blue: 167/255)
    static let lightTab = Color(red: 228/255, green: 230/255, blue: 0/255)
    
    static let waterBackground = Color(red: 69/255, green: 175/255, blue: 237/255)
    static let waterSlider = Color(red: 82/255, green: 214/255, blue: 255/255)
    static let waterSwitch = Color(red: 193/255, green: 193/255, blue: 193/255)
    
    static let lightGradient = Gradient(colors: [lightSliderStart.opacity(0.3), lightSliderStart.opacity(1.0)])
    
    static let lightLinearGradient = LinearGradient(gradient: lightGradient, startPoint: .top, endPoint: .bottom)
}
