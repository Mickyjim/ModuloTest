//
//  TabManager.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

class TabManager: ObservableObject {
    @Published var tabMenus = AppData.menus
    @Published var lastSelectedIndex = -1
    
    func selectMenu(index: Int) {
        if index != lastSelectedIndex {
            tabMenus[index].selected = true
            
            if lastSelectedIndex != -1 {
                tabMenus[lastSelectedIndex].selected = false
            }
            lastSelectedIndex = index
        }
    }
}
