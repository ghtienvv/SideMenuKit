//
//  RightMenuView.swift
//  EasySideMenu_Example
//
//  Created by Tienvv on 05/04/2024.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import SideMenuKit

struct RightMenuView: View {

    @Environment(\.safeAreaInsets) private var safeAreaInsets

    var style: SMKStyle

    var body: some View {
        GeometryReader {
            VStack(alignment: .center, spacing: 20) {
                if style == .pourToRight {
                    Spacer()
                }

                Text("Apple")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 80, height: 80)
                    .background(.green)
                    .clipShape(.circle)

                Text("iOS")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 80, height: 80)
                    .background(.red)
                    .clipShape(.circle)

                Text("SwiftUI")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 80, height: 80)
                    .background(.purple)
                    .clipShape(.circle)

                Text("UIKit")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 80, height: 80)
                    .background(.cyan)
                    .clipShape(.circle)

            }
            .padding(safeAreaInsets)
            .frame(width: $0.size.width)
        }
    }
}

#Preview {
    RightMenuView(style: .classic)
}
