//
//  SwiftUIRootView.swift
//  EasySideMenu_Example
//
//  Created by Tienvv on 28/03/2024.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import SideMenuKit

struct SwiftUIRootView: View {
    
    @State private var isShowLeftMenu: Bool = false
    @State private var isShowRightMenu: Bool = false
    
    private var leftStyle: SMKStyle = .classic
    private var rightStyle: SMKStyle = .classic
    
    var body: some View {
        //        LeftMenu()
        
        //        RightMenu()
        
        BothMenu()
    }
    
    @ViewBuilder
    private func RightMenu() -> some View {
        SMKView(
            rightStyle: rightStyle,
            rightMenuWidth: 100,
            showRightMenu: $isShowRightMenu,
            content: {
                MainView(showLeftMenu: $isShowLeftMenu,
                         showRightMenu: $isShowRightMenu,
                         showLeftMenuIcon: false,
                         showRightMenuIcon: true)
            },
            rightMenu: {
                RightMenuView(style: rightStyle)
            },
            rightBackground: {
                Rectangle()
                    .fill(Color.black.opacity(0.8))
            }
        )
    }
    
    @ViewBuilder
    private func LeftMenu() -> some View {
        SMKView(
            leftStyle: leftStyle,
            showLeftMenu: $isShowLeftMenu,
            content: {
                MainView(showLeftMenu: $isShowLeftMenu,
                         showRightMenu: $isShowRightMenu,
                         showLeftMenuIcon: true,
                         showRightMenuIcon: false)
            },
            leftMenu: {
                LeftMenuView()
            },
            leftBackground: {
                Rectangle()
                    .fill(Color.black.opacity(0.8))
            }
        )
    }
    
    @ViewBuilder
    private func BothMenu() -> some View {
        SMKView(
            leftStyle: leftStyle,
            rightStyle: rightStyle,
            rightMenuWidth: 100,
            showLeftMenu: $isShowLeftMenu,
            showRightMenu: $isShowRightMenu,
            content: {
                MainView(showLeftMenu: $isShowLeftMenu,
                         showRightMenu: $isShowRightMenu,
                         showLeftMenuIcon: true,
                         showRightMenuIcon: true)
            },
            leftMenu: {
                LeftMenuView()
            },
            leftBackground: {
                Rectangle()
                    .fill(Color.black.opacity(0.8))
            },
            rightMenu: {
                RightMenuView(style: rightStyle)
            }, rightBackground: {
                Rectangle()
                    .fill(Color.black.opacity(0.8))
            }
        )
    }
}

#Preview {
    SwiftUIRootView()
}
