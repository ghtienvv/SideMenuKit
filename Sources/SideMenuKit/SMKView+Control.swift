//
//  SMKView+Control.swift
//
//
//  Created by Tienvv on 03/04/2024.
//

import Foundation

extension SMKView {
    
    /// Show side menu
    internal func showSideMenu() {
        var style: SMKStyle = .classic

        switch currentSide {
        case .left:
            supperOffsetX = leftMenuWidth
            supperLastOffsetX = supperOffsetX
            showLeftMenu = true
            style = leftStyle
        case .right:
            supperOffsetX = -rightMenuWidth
            supperLastOffsetX = -supperOffsetX
            showRightMenu = true
            style = rightStyle
        case .none:
            break
        }

        switch style {
        case .clipToCorner(let side, let offsetY):
            let validOffsetY = clipToCornerValidate(offsetY)
            switch side {
            case .top:
                supperOffsetY = -validOffsetY
                menuOffsetY = validOffsetY
            case .bottom:
                supperOffsetY = validOffsetY
                menuOffsetY = -validOffsetY
            }
        case .clipToCenter(let height):
            let validHeight = clipToCenterValidate(height)
            if validHeight < actualScreenSize.height {
                contentHeight = validHeight
            } else {
                contentHeight = validHeight
            }
        default:
            supperOffsetY = 0.0
        }
        calculateProgress()
    }

    /// Reset to initial (Hiden Menu)
    internal func reset() {
        supperOffsetX = 0
        supperOffsetY = 0
        supperLastOffsetX = 0
        menuOffsetY = 0
        showLeftMenu = false
        showRightMenu = false
        contentHeight = nil
        calculateProgress()
        currentSide = .none
    }
}
