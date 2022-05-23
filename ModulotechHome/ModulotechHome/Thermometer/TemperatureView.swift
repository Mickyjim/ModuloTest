//
//  TemperatureView.swift
//  ModulotechHome
//
//  Created by Michael Favre on 22/05/2022.
//

import SwiftUI

struct TemperatureView : View {
    @State var temperatureValue: CGFloat = 0.0
    var body: some View {
        VStack {
            Text("Room")
                .font(.largeTitle)
                .bold()
                .foregroundColor(ColorConstants.textColorPrimary)
            Text("Temperature")
                .font(.body)
                .foregroundColor(ColorConstants.textColorSecondary)
            
            TemperatureControlView(temperatureValue: $temperatureValue)
                .padding(.top, 60)
            
            Spacer()
            
            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text("\(String.init(format: "%.0f", temperatureValue))")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundColor(ColorConstants.textColorPrimary)
                Text("°C")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(ColorConstants.textColorPrimary)
            }
            Spacer()
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
