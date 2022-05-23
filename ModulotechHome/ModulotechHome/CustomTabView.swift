//
//  CustomTabView.swift
//  ModulotechHome
//
//  Created by Michael Favre on 23/05/2022.
//

import SwiftUI

struct CustomTabView: View {
    @ObservedObject var manager: TabManager
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .frame(height: 80)
            
            HStack(spacing: 18) {
                ForEach(manager.tabMenus) { menu in
                    MenuItemView(menu: menu)
                        .onTapGesture {
                            manager.selectMenu(index: menu.id)
                        }
                }
            }
        }
        .onAppear {
            manager.selectMenu(index: 0)
        }
    }
}

struct MenuItemView: View {
    let menu: TabMenu
    var body: some View {
        ZStack {
            Circle()
                .fill(menu.color)
                .frame(width: 50, height: 50)
                .opacity(menu.selected ? 1.0 : 0.0)
            
            Image(systemName: menu.imageName)
                .foregroundColor(menu.selected ? .white : .gray)
                .font(.title2)
        }
    }
}

struct TabMenu: Identifiable {
    let id: Int
    let imageName: String
    let color: Color
    var selected: Bool = false
    
}
