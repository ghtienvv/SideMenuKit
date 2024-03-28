//
//  SMKView+Gesture.swift
//
//
//  Created by Tienvv on 03/04/2024.
//

import Foundation
import SwiftUI

extension SMKView {
    /// Drag Gesture
    internal var dragGesture: some Gesture {
        DragGesture()
            .updating($isDragging) { a1, out, a2 in
                guard allowSwipeToOpenMenu else {
                    return
                }

                out = true
            }.onChanged { value in

                guard allowSwipeToOpenMenu else {
                    return
                }
                
                var style: SMKStyle = .classic

                updateCurrentSideWhenDarging(width: value.translation.width)

                switch currentSide {
                case .none: break
                case .left:
                    let translationWidth = value.translation.width
                    let transtationX = isDragging ? max(min(translationWidth + supperLastOffsetX, leftMenuWidth), 0) : 0

                    supperOffsetX = transtationX
                    calculateProgress()
                    style = leftStyle
                case .right:
                    let translationWidth = -value.translation.width
                    let transtationX = isDragging ? max(min(translationWidth + supperLastOffsetX, rightMenuWidth), 0) : 0

                    supperOffsetX = -transtationX
                    calculateProgress()
                    style = rightStyle
                }

                switch style {
                case .clipToCorner(let side, let offsetY):
                    let validOffsetY = clipToCornerValidate(offsetY)
                    switch side {
                    case .top:
                        supperOffsetY = -validOffsetY * progress
                        menuOffsetY = validOffsetY
                    case .bottom:
                        supperOffsetY = validOffsetY * progress
                        menuOffsetY = -validOffsetY
                    }
                case .clipToCenter(let height):
                    let validHeight = clipToCenterValidate(height)
                    let margin = actualScreenSize.height - validHeight
                    contentHeight = actualScreenSize.height - (margin * progress)
                default:
                    supperOffsetY = 0.0
                }
            }.onEnded { value in

                guard allowSwipeToOpenMenu else {
                    return
                }

                withAnimation(animation) {
                    switch currentSide {
                    case .none: break
                    case .left:
                        let velocityX = value.velocity.width / 8
                        let total = velocityX + supperOffsetX

                        if total > (leftMenuWidth * 0.5) {
                            showSideMenu()
                        } else {
                            reset()
                        }
                    case .right:
                        let velocityX = -(value.velocity.width) / 8
                        let total = velocityX + (showRightMenu ? supperOffsetX : abs(supperOffsetX))

                        if total > (rightMenuWidth * 0.5) {
                            showSideMenu()
                        } else {
                            reset()
                        }
                    }
                }
            }
    }

    /// update current side when draging
    private func updateCurrentSideWhenDarging(width: CGFloat) {
        guard currentSide == .none else {
            return
        }

        if width > 0 {
            /// user is darging from left to right
            guard leftMenuWidth != 0 else {
                return
            }
            currentSide = .left
        } else {
            /// user is darging from right to left
            guard rightMenuWidth != 0 else {
                return
            }
            currentSide = .right
        }
    }
}
