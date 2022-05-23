//
//  ContentView.swift
//  ModulotechHome
//
//  Created by Michael Favre on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tabManager = TabManager()
    var body: some View {
        VStack {
            switch tabManager.lastSelectedIndex {
            case 0 :
                TemperatureView()
            case 1 :
                LightView()
            case 2 :
                ShutterView()
            default :
                Text("Default")
            }
            Spacer()
            CustomTabView(manager: tabManager)
                .padding(.leading, 30)
                .padding(.trailing, 30)
        }
        .padding(.top, 60)
        .padding(.bottom, 40)
        .background(ColorConstants.background)
        .edgesIgnoringSafeArea(.all)
    }
}

struct AppData {
    static let menus =  [
        TabMenu(id: 0, imageName: "thermometer", color: ColorConstants.tempBackground),
        TabMenu(id: 1, imageName: "lightbulb", color: ColorConstants.lightTab),
        TabMenu(id: 2, imageName: "text.justify", color: ColorConstants.waterBackground),
    ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
