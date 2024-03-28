//
//  LeftMenuView.swift
//  EasySideMenu_Example
//
//  Created by Tienvv on 28/03/2024.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import SideMenuKit

struct LeftMenuView: View {

    @Environment(\.safeAreaInsets) private var safeAreaInsets

    enum MenuItem: String, CaseIterable {
        case avatar = "person.circle"
        case home = "house.fill"
        case bookmark = "book.fill"
        case favourites = "heart.fill"
        case profile = "person.crop.circle"
        case logout = "rectangle.portrait.and.arrow.forward.fill"

        var title: String {
            switch self {
            case .avatar:
                return "Hello, SideMenuKit"
            case .home:
                return "Home"
            case .bookmark:
                return "Bookmark"
            case .favourites:
                return "Favourites"
            case .profile:
                return "Profile"
            case .logout:
                return "Logout"
            }
        }
    }

    var body: some View {
        SideMenu()
    }

    @ViewBuilder
    private func SideMenu() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SideMenuUserItem(.avatar)

            SideMenuOtherItem(.home)
            SideMenuOtherItem(.bookmark)
            SideMenuOtherItem(.favourites)
            SideMenuOtherItem(.profile)

            Spacer(minLength: 0)

            SideMenuOtherItem(.logout)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 20)
        .padding(safeAreaInsets)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .environment(\.colorScheme, .dark)
    }

    @ViewBuilder
    private func SideMenuUserItem(_ item: MenuItem, onTap: @escaping () -> () = { }) -> some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 6) {
                Image(systemName: item.rawValue)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color.gray.opacity(0.5))

                Text(item.title)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.primary)
            }
            .padding(.vertical, 10)
            .contentShape(.rect)
        }
    }

    @ViewBuilder
    private func SideMenuOtherItem(_ item: MenuItem, onTap: @escaping () -> () = { }) -> some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                Image(systemName: item.rawValue)
                    .font(.title3)
                    .foregroundStyle(Color.red)

                Text(item.title)
                    .font(.callout)

                Spacer(minLength: 0)
            }
            .padding(.vertical, 10)
            .contentShape(.rect)
            .foregroundStyle(Color.primary)
        }
    }
}
