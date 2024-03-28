//
//  SMKView+UI.swift
//
//
//  Created by Tienvv on 05/04/2024.
//

import SwiftUI

extension SMKView {

    /// Side Menu View
    @ViewBuilder
    internal func SideMenuView(size: CGSize) -> some View {
        HStack(spacing: 0) {

            GeometryReader { _ in
                leftMenu()
            }
            .frame(width: leftMenuWidth)
            .offset(y: menuOffsetY)
            .contentShape(.rect)

            GeometryReader { _ in
                content()
            }
            .frame(width: size.width, 
                   height: contentHeight == nil ? size.height : contentHeight!)
            .overlay {
                if progress > 0 {
                    Rectangle()
                        .fill(overlayColorWhenOpenMenu)
                        .onTapGesture {
                            if allowTapContentToCloseMenu {
                                withAnimation(animation) {
                                    reset()
                                }
                            }
                        }
                }
            }
            .mask {
                RoundedRectangle(cornerRadius: progress * cornerRadius)
            }
            .scaleEffect(calculateScaleEffect(),
                         anchor: .trailing)
            .rotation3DEffect(Angle(degrees: calculateAngleRotation3DEffect()),
                              axis: calculateRotationAxis())

            GeometryReader { _ in
                rightMenu()
            }
            .frame(width: rightMenuWidth)
            .offset(y: menuOffsetY)
            .contentShape(.rect)
        }
        .frame(width: size.width + rightMenuWidth + leftMenuWidth, 
               height: size.height)
        .offset(x: -leftMenuWidth)
        .offset(x: supperOffsetX,
                y: supperOffsetY)
    }
}
