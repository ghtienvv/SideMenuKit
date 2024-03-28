//
//  MainView.swift
//  EasySideMenu_Example
//
//  Created by Tienvv on 28/03/2024.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import SideMenuKit

struct MainView: View {

    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool
    private var showLeftMenuIcon: Bool
    private var showRightMenuIcon: Bool

    init(showLeftMenu: Binding<Bool>,
         showRightMenu: Binding<Bool>,
         showLeftMenuIcon: Bool,
         showRightMenuIcon: Bool) {
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = showRightMenu
        self.showLeftMenuIcon = showLeftMenuIcon
        self.showRightMenuIcon = showRightMenuIcon
        UITabBar.appearance().backgroundColor = UIColor.systemGray5
    }

    var body: some View {
        TabView {
            iPhoneView()
                .tabItem {
                    Label("iPhone", systemImage: "iphone")
                }
                .tag(0)

            iPadView()
                .tabItem {
                    Label("iPad", systemImage: "ipad")
                }
                .tag(1)

            MacbookView()
                .tabItem {
                    Label("Macbook", systemImage: "macbook")
                }
                .tag(2)
        }
    }

    @ViewBuilder
    private func iPhoneView() -> some View {
        NavigationView {
            Text("iPhone")
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showRightMenu.toggle()
                    } label: {
                        Image(systemName: showRightMenu ? "xmark" : "line.3.horizontal")
                            .foregroundColor(Color.primary)
                    }
                    .opacity(showRightMenuIcon ? 1 : 0)
                    .disabled(!showRightMenuIcon)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showLeftMenu.toggle()
                    } label: {
                        Image(systemName: showLeftMenu ? "xmark" : "line.3.horizontal")
                            .foregroundColor(Color.primary)
                    }
                    .opacity(showLeftMenuIcon ? 1 : 0)
                    .disabled(!showLeftMenuIcon)
                }
            }
        }
    }

    @ViewBuilder
    private func iPadView() -> some View {
        Text("iPad")
    }

    @ViewBuilder
    private func MacbookView() -> some View {
        Text("Macbook")
    }
}
