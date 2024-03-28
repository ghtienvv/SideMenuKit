//
//  SMKEmtity.swift
//
//
//  Created by Tienvv on 29/03/2024.
//

import Foundation

public enum SMKSide {
    case left
    case right
    case none
}

public enum SMKRotation3DStyle {
    case flipOutside
    case flipInside
}

public enum SMKClipToCorner {
    case top
    case bottom
}

public enum SMKStyle {
    case classic
    case rotation3D(_ flip: SMKRotation3DStyle, _ rotation: CGFloat)
    case pourToRight
    case pourToLeft
    case clipToCorner(_ side: SMKClipToCorner,_ offsetY: Double)
    case clipToCenter(_ contentHeight: CGFloat)
}

extension SMKStyle: Equatable {
    public static func ==(lsh: SMKStyle, rsh: SMKStyle) -> Bool {
        switch (lsh, rsh) {
        case (.classic, .classic):
            return true
        case (.rotation3D, .rotation3D):
            return true
        case (.pourToRight, .pourToRight):
            return true
        case (.pourToLeft, .pourToLeft):
            return true
        case (.clipToCorner, .clipToCorner):
            return true
        case (.clipToCenter, .clipToCenter):
            return true
        default:
            return false
        }
    }
}

extension SMKClipToCorner: Equatable {
    public static func ==(lsh: SMKClipToCorner, rsh: SMKClipToCorner) -> Bool {
        switch (lsh, rsh) {
        case (.top, .top):
            return true
        case (.bottom, .bottom):
            return true
        default:
            return false
        }
    }
}

extension SMKRotation3DStyle: Equatable {
    public static func ==(lsh: SMKRotation3DStyle, rsh: SMKRotation3DStyle) -> Bool {
        switch (lsh, rsh) {
        case (.flipOutside, .flipOutside):
            return true
        case (.flipInside, .flipInside):
            return true
        default:
            return false
        }
    }
}

extension SMKSide: Equatable {
    public static func ==(lsh: SMKSide, rsh: SMKSide) -> Bool {
        switch (lsh, rsh) {
        case (.left, .left):
            return true
        case (.right, .right):
            return true
        case (.none, .none):
            return true
        default:
            return false
        }
    }
}
