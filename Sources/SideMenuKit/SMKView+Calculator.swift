//
//  SMKView+Calculator.swift
//
//
//  Created by Tienvv on 03/04/2024.
//

import Foundation

extension SMKView {

    /// Convert's offset into Series if progress ranging from 0 - 1
    internal func calculateProgress() {
        switch currentSide {
        case .left:
            progress = max(min(abs(supperOffsetX) / leftMenuWidth, 1), 0)
        case .right:
            progress = max(min(abs(supperOffsetX) / rightMenuWidth, 1), 0)
        case .none:
            break
        }
    }

    /// Style clipToCenter: Validate the height
    internal func clipToCenterValidate(_ height: CGFloat) -> CGFloat {
        if height <= actualScreenSize.height / 3 {
            return actualScreenSize.height / 3
        } else if height >= actualScreenSize.height {
            return actualScreenSize.height
        } else {
            return height
        }
    }

    /// Style clipToCorner: Validate the padding
    internal func clipToCornerValidate(_ offsetY: CGFloat) -> CGFloat {
        if offsetY >= actualScreenSize.height / 2 {
            return actualScreenSize.height / 2
        } else if offsetY <= 100 {
            return 100
        } else {
            return offsetY
        }
    }

    /// Content scale effect
    internal func calculateScaleEffect() -> CGFloat {
        let style = currentSide == .left ? leftStyle : rightStyle
        switch style {
        case .classic:
            return 1.0
        case .rotation3D:
            return 1.0 - (progress * 0.1)
        case .pourToRight:
            return 1.0 - (progress * 0.1)
        case .pourToLeft:
            return 1.0 - (progress * 0.1)
        case .clipToCorner:
            return 1.0
        case .clipToCenter:
            return 1.0
        }
    }

    /// Content rotation
    internal func calculateAngleRotation3DEffect() -> Double {
        let style = currentSide == .left ? leftStyle : rightStyle
        switch style {
        case .classic:
            return 0.0
        case .rotation3D(_, let rotation):
            let rotation = validateRotation(rotation)
            return (progress * -rotation)
        case .pourToRight:
            return (progress * -8.0)
        case .pourToLeft:
            return (progress * -8.0)
        case .clipToCorner:
            return 0.0
        case .clipToCenter:
            return 0.0
        }
    }

    /// Content axis
    internal func calculateRotationAxis() -> (x: CGFloat, y: CGFloat, z: CGFloat) {
        let style = currentSide == .left ? leftStyle : rightStyle
        switch style {
        case .classic:
            return (x: 0.0,
                    y: 1.0,
                    z: 0.0)
        case .rotation3D(let flip, _):
            switch flip {
            case .flipOutside:
                switch currentSide {
                case .left:
                    return (x: 0.0,
                            y: -1.0,
                            z: 0.0)
                case .right:
                    return (x: 0.0,
                            y: 1.0,
                            z: 0.0)
                case .none:
                    return (x: 0.0,
                            y: 0.0,
                            z: 0.0)
                }
            case .flipInside:
                switch currentSide {
                case .left:
                    return (x: 0.0,
                            y: 1.0,
                            z: 0.0)
                case .right:
                    return (x: 0.0,
                            y: -1.0,
                            z: 0.0)
                case .none:
                    return (x: 0.0,
                            y: 0.0,
                            z: 0.0)
                }
            }
        case .pourToRight:
            return (x: 0.0,
                    y: 0.0,
                    z: -0.5)
        case .pourToLeft:
            return (x: 0.0,
                    y: 0.0,
                    z: 0.5)
        case .clipToCorner:
            return (x: 0.0,
                    y: 0.0,
                    z: 0.0)
        case .clipToCenter:
            return (x: 0.0,
                    y: 1.0,
                    z: 0.0)
        }
    }

    /// validate 3D rotation
    private func validateRotation(_ rotation: CGFloat) -> CGFloat {
        if rotation < 0 {
            return 0
        } else if rotation > 90 {
            return 90
        } else {
            return rotation
        }
    }
}
