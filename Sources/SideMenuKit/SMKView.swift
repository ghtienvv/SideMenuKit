//
//  SMKView.swift
//
//
//  Created by Tienvv on 28/03/2024.
//

import SwiftUI

public struct SMKView<Content: View,
                      LeftMenu: View,
                      RightMenu: View,
                      LeftBackground: View,
                      RightBackground: View>: View {

    /// ---------------------------- Menu Config ----------------------------
    // -- default value --
    internal var leftStyle: SMKStyle = .classic
    internal var rightStyle: SMKStyle = .classic
    internal var animation: Animation = .snappy(duration: 0.25, extraBounce: 0.0)
    internal var leftMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5
    internal var rightMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5
    internal var cornerRadius: CGFloat = 25.0
    internal var overlayColorWhenOpenMenu: Color = Color.black.opacity(0.2)
    internal var allowTapContentToCloseMenu: Bool = true
    /// --------------------------------------------

    /// ---------------------------- Binding Properties ----------------------------
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool
    @Binding var allowSwipeToOpenMenu: Bool
    /// --------------------------------------------

    /// ---------------------------- State Properties ----------------------------
    @State internal var currentSide: SMKSide = .none
    /// --------------------------------------------

    /// ---------------------------- Content Views ----------------------------
    @ViewBuilder internal var content: () -> Content
    @ViewBuilder internal var leftMenu: () -> LeftMenu
    @ViewBuilder internal var leftBackground: LeftBackground
    @ViewBuilder internal var rightMenu: () -> RightMenu
    @ViewBuilder internal var rightBackground: RightBackground
    /// --------------------------------------------

    /// ---------------------------- View Properties ----------------------------
    // Supper view (HStack)
    @State internal var supperOffsetX: CGFloat = 0
    @State internal var supperLastOffsetX: CGFloat = 0
    @State internal var supperOffsetY: CGFloat = 0
    @State internal var actualScreenSize: CGSize = .zero

    // Content view
    @State internal var contentHeight: CGFloat? = nil

    // Menu view
    @State internal var menuOffsetY: CGFloat = 0

    // Common
    @State internal var progress: CGFloat = 0
    @GestureState internal var isDragging: Bool = false
    /// --------------------------------------------

    // MARK: - Initial

    /// - Parameters:
    ///   - leftStyle: Left Menu's style, default is .classic
    ///   - rightStyle: Right Menu's style, default is .classic
    ///   - animation: Animation open the Menu, default is .snappy(duration: 0.25, extraBounce: 0.1)
    ///   - leftMenuWidth: left Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - rightMenuWidth: right Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - cornerRadius: Content radius, default is 25
    ///   - overlayColorWhenOpenMenu: Overlay of content when opening the Menu, default is Color.black.opacity(0.3)
    ///   - allowTapContentToCloseMenu: allow tap content to close, default is true
    ///   - showLeftMenu: Open/Close left Menu's state
    ///   - showRightMenu: Open/Close right Menu's state
    ///   - allowSwipeToOpenMenu: Open/Close Menu by swipe gesture. default is true
    ///   - content: The View when Menu closed
    ///   - leftMenu: The left view when Menu is opening
    ///   - leftBackground: The left background of left Menu
    ///   - rightMenu: The right view when Menu is opening
    ///   - rightBackground: The right background of left Menu
    public init(leftStyle: SMKStyle = .classic,
                rightStyle: SMKStyle = .classic,
                animation: Animation = .snappy(duration: 0.25, extraBounce: 0.1),
                leftMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                rightMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                cornerRadius: CGFloat = 25,
                overlayColorWhenOpenMenu: Color = Color.black.opacity(0.3),
                allowTapContentToCloseMenu: Bool = true,
                showLeftMenu: Binding<Bool>,
                showRightMenu: Binding<Bool>,
                allowSwipeToOpenMenu: Binding<Bool> = .constant(true),
                content: @escaping () -> Content,
                leftMenu: @escaping () -> LeftMenu,
                leftBackground: @escaping () -> LeftBackground,
                rightMenu: @escaping () -> RightMenu,
                rightBackground: @escaping () -> RightBackground) {
        self.leftStyle = leftStyle
        self.rightStyle = rightStyle
        self.animation = animation
        self.leftMenuWidth = min(leftMenuWidth, UIScreen.main.bounds.width)
        self.rightMenuWidth = min(rightMenuWidth, UIScreen.main.bounds.width)
        self.cornerRadius = cornerRadius
        self.overlayColorWhenOpenMenu = overlayColorWhenOpenMenu
        self.allowTapContentToCloseMenu = allowTapContentToCloseMenu
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = showRightMenu
        self._allowSwipeToOpenMenu = allowSwipeToOpenMenu
        self.content = content
        self.leftMenu = leftMenu
        self.leftBackground = leftBackground()
        self.rightMenu = rightMenu
        self.rightBackground = rightBackground()
    }

    /// - Parameters:
    ///   - leftStyle: Left Menu's style, default is .classic
    ///   - rightStyle: Right Menu's style, default is .classic
    ///   - animation: Animation open the Menu, default is .snappy(duration: 0.25, extraBounce: 0.1)
    ///   - leftMenuWidth: left Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - rightMenuWidth: right Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - cornerRadius: Content radius, default is 25
    ///   - overlayColorWhenOpenMenu: Overlay of content when opening the Menu, default is Color.black.opacity(0.3)
    ///   - allowTapContentToCloseMenu: allow tap content to close, default is true
    ///   - showLeftMenu: Open/Close left Menu's state
    ///   - showRightMenu: Open/Close right Menu's state
    ///   - allowSwipeToOpenMenu: Open/Close Menu by swipe gesture. default is true
    ///   - content: The View when Menu closed
    ///   - leftMenu: The left view when Menu is opening
    ///   - rightMenu: The right view when Menu is opening
    ///   - rightBackground: The right background of left Menu
    public init(leftStyle: SMKStyle = .classic,
                rightStyle: SMKStyle = .classic,
                animation: Animation = .snappy(duration: 0.25, extraBounce: 0.1),
                leftMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                rightMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                cornerRadius: CGFloat = 25,
                overlayColorWhenOpenMenu: Color = Color.black.opacity(0.3),
                allowTapContentToCloseMenu: Bool = true,
                showLeftMenu: Binding<Bool>,
                showRightMenu: Binding<Bool>,
                allowSwipeToOpenMenu: Binding<Bool> = .constant(true),
                content: @escaping () -> Content,
                leftMenu: @escaping () -> LeftMenu,
                leftBackground: @escaping () -> LeftBackground,
                rightMenu: @escaping () -> RightMenu,
                rightBackground: @escaping () -> RightBackground) where LeftBackground == EmptyView {
        self.leftBackground = EmptyView()

        self.leftStyle = leftStyle
        self.rightStyle = rightStyle
        self.animation = animation
        self.leftMenuWidth = min(leftMenuWidth, UIScreen.main.bounds.width)
        self.rightMenuWidth = min(rightMenuWidth, UIScreen.main.bounds.width)
        self.cornerRadius = cornerRadius
        self.overlayColorWhenOpenMenu = overlayColorWhenOpenMenu
        self.allowTapContentToCloseMenu = allowTapContentToCloseMenu
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = showRightMenu
        self._allowSwipeToOpenMenu = allowSwipeToOpenMenu
        self.content = content
        self.leftMenu = leftMenu
        self.rightMenu = rightMenu
        self.rightBackground = rightBackground()
    }

    /// - Parameters:
    ///   - leftStyle: Left Menu's style, default is .classic
    ///   - rightStyle: Right Menu's style, default is .classic
    ///   - animation: Animation open the Menu, default is .snappy(duration: 0.25, extraBounce: 0.1)
    ///   - leftMenuWidth: left Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - rightMenuWidth: right Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - cornerRadius: Content radius, default is 25
    ///   - overlayColorWhenOpenMenu: Overlay of content when opening the Menu, default is Color.black.opacity(0.3)
    ///   - allowTapContentToCloseMenu: allow tap content to close, default is true
    ///   - showLeftMenu: Open/Close left Menu's state
    ///   - showRightMenu: Open/Close right Menu's state
    ///   - allowSwipeToOpenMenu: Open/Close Menu by swipe gesture. default is true
    ///   - content: The View when Menu closed
    ///   - leftMenu: The left view when Menu is opening
    ///   - leftBackground: The left background of left Menu
    ///   - rightMenu: The right view when Menu is opening
    public init(leftStyle: SMKStyle = .classic,
                rightStyle: SMKStyle = .classic,
                animation: Animation = .snappy(duration: 0.25, extraBounce: 0.1),
                leftMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                rightMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                cornerRadius: CGFloat = 25,
                overlayColorWhenOpenMenu: Color = Color.black.opacity(0.3),
                allowTapContentToCloseMenu: Bool = true,
                showLeftMenu: Binding<Bool>,
                showRightMenu: Binding<Bool>,
                allowSwipeToOpenMenu: Binding<Bool> = .constant(true),
                content: @escaping () -> Content,
                leftMenu: @escaping () -> LeftMenu,
                leftBackground: @escaping () -> LeftBackground,
                rightMenu: @escaping () -> RightMenu) where RightBackground == EmptyView {
        self.rightBackground = EmptyView()

        self.leftStyle = leftStyle
        self.rightStyle = rightStyle
        self.animation = animation
        self.leftMenuWidth = min(leftMenuWidth, UIScreen.main.bounds.width)
        self.rightMenuWidth = min(rightMenuWidth, UIScreen.main.bounds.width)
        self.cornerRadius = cornerRadius
        self.overlayColorWhenOpenMenu = overlayColorWhenOpenMenu
        self.allowTapContentToCloseMenu = allowTapContentToCloseMenu
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = showRightMenu
        self._allowSwipeToOpenMenu = allowSwipeToOpenMenu
        self.content = content
        self.leftMenu = leftMenu
        self.leftBackground = leftBackground()
        self.rightMenu = rightMenu
    }

    /// - Parameters:
    ///   - leftStyle: Left Menu's style, default is .classic
    ///   - animation: Animation open the Menu, default is .snappy(duration: 0.25, extraBounce: 0.1)
    ///   - leftMenuWidth: left Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - cornerRadius: Content radius, default is 25
    ///   - overlayColorWhenOpenMenu: Overlay of content when opening the Menu, default is Color.black.opacity(0.3)
    ///   - allowTapContentToCloseMenu: allow tap content to close, default is true
    ///   - showLeftMenu: Open/Close left Menu's state
    ///   - allowSwipeToOpenMenu: Open/Close Menu by swipe gesture. default is true
    ///   - content: The View when Menu closed
    ///   - leftMenu: The left view when Menu is opening
    ///   - leftBackground: The left background of left Menu
    public init(leftStyle: SMKStyle = .classic,
                animation: Animation = .snappy(duration: 0.25, extraBounce: 0.1),
                leftMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                cornerRadius: CGFloat = 25,
                overlayColorWhenOpenMenu: Color = Color.black.opacity(0.3),
                allowTapContentToCloseMenu: Bool = true,
                showLeftMenu: Binding<Bool>,
                allowSwipeToOpenMenu: Binding<Bool> = .constant(true),
                content: @escaping () -> Content,
                leftMenu: @escaping () -> LeftMenu,
                leftBackground: @escaping () -> LeftBackground) where RightMenu == EmptyView, RightBackground == EmptyView {
        self.rightMenu = { EmptyView() }
        self.rightBackground = EmptyView()

        self.leftStyle = leftStyle
        self.animation = animation
        self.leftMenuWidth = min(leftMenuWidth, UIScreen.main.bounds.width)
        self.rightMenuWidth = 0
        self.cornerRadius = cornerRadius
        self.overlayColorWhenOpenMenu = overlayColorWhenOpenMenu
        self.allowTapContentToCloseMenu = allowTapContentToCloseMenu
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = .constant(false)
        self._allowSwipeToOpenMenu = allowSwipeToOpenMenu
        self.content = content
        self.leftMenu = leftMenu
        self.leftBackground = leftBackground()
    }

    /// - Parameters:
    ///   - leftStyle: Left Menu's style, default is .classic
    ///   - animation: Animation open the Menu, default is .snappy(duration: 0.25, extraBounce: 0.1)
    ///   - leftMenuWidth: left Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - cornerRadius: Content radius, default is 25
    ///   - overlayColorWhenOpenMenu: Overlay of content when opening the Menu, default is Color.black.opacity(0.3)
    ///   - allowTapContentToCloseMenu: allow tap content to close, default is true
    ///   - showLeftMenu: Open/Close left Menu's state
    ///   - allowSwipeToOpenMenu: Open/Close Menu by swipe gesture. default is true
    ///   - content: The View when Menu closed
    ///   - leftMenu: The left view when Menu is opening
    public init(leftStyle: SMKStyle = .classic,
                animation: Animation = .snappy(duration: 0.25, extraBounce: 0.1),
                leftMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                cornerRadius: CGFloat = 25,
                overlayColorWhenOpenMenu: Color = Color.black.opacity(0.3),
                allowTapContentToCloseMenu: Bool = true,
                showLeftMenu: Binding<Bool>,
                allowSwipeToOpenMenu: Binding<Bool> = .constant(true),
                content: @escaping () -> Content,
                leftMenu: @escaping () -> LeftMenu) where RightMenu == EmptyView, RightBackground == EmptyView, LeftBackground == EmptyView {
        self.rightMenu = { EmptyView() }
        self.rightBackground = EmptyView()
        self.leftBackground = EmptyView()

        self.leftStyle = leftStyle
        self.animation = animation
        self.leftMenuWidth = min(leftMenuWidth, UIScreen.main.bounds.width)
        self.rightMenuWidth = 0
        self.cornerRadius = cornerRadius
        self.overlayColorWhenOpenMenu = overlayColorWhenOpenMenu
        self.allowTapContentToCloseMenu = allowTapContentToCloseMenu
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = .constant(false)
        self._allowSwipeToOpenMenu = allowSwipeToOpenMenu
        self.content = content
        self.leftMenu = leftMenu
    }

    /// - Parameters:
    ///   - rightStyle: Right Menu's style, default is .classic
    ///   - animation: Animation open the Menu, default is .snappy(duration: 0.25, extraBounce: 0.1)
    ///   - rightMenuWidth: right Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - cornerRadius: Content radius, default is 25
    ///   - overlayColorWhenOpenMenu: Overlay of content when opening the Menu, default is Color.black.opacity(0.3)
    ///   - allowTapContentToCloseMenu: allow tap content to close, default is true
    ///   - showRightMenu: Open/Close right Menu's state
    ///   - allowSwipeToOpenMenu: Open/Close Menu by swipe gesture. default is true
    ///   - content: The View when Menu closed
    ///   - rightMenu: The right view when Menu is opening
    ///   - rightBackground: The right background of left Menu
    public init(rightStyle: SMKStyle = .classic,
                animation: Animation = .snappy(duration: 0.25, extraBounce: 0.1),
                rightMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                cornerRadius: CGFloat = 25,
                overlayColorWhenOpenMenu: Color = Color.black.opacity(0.3),
                allowTapContentToCloseMenu: Bool = true,
                showRightMenu: Binding<Bool>,
                allowSwipeToOpenMenu: Binding<Bool> = .constant(true),
                content: @escaping () -> Content,
                rightMenu: @escaping () -> RightMenu,
                rightBackground: @escaping () -> RightBackground) where LeftMenu == EmptyView, LeftBackground == EmptyView {
        self.leftMenu = { EmptyView() }
        self.leftBackground = EmptyView()

        self.rightStyle = rightStyle
        self.animation = animation
        self.leftMenuWidth = 0
        self.rightMenuWidth = min(rightMenuWidth, UIScreen.main.bounds.width)
        self.cornerRadius = cornerRadius
        self.overlayColorWhenOpenMenu = overlayColorWhenOpenMenu
        self.allowTapContentToCloseMenu = allowTapContentToCloseMenu
        self._showRightMenu = showRightMenu
        self._showLeftMenu = .constant(false)
        self._allowSwipeToOpenMenu = allowSwipeToOpenMenu
        self.content = content
        self.rightMenu = rightMenu
        self.rightBackground = rightBackground()
    }

    /// - Parameters:
    ///   - rightStyle: Right Menu's style, default is .classic
    ///   - animation: Animation open the Menu, default is .snappy(duration: 0.25, extraBounce: 0.1)
    ///   - rightMenuWidth: right Menu width, default is UIScreen.main.bounds.width * 0.5
    ///   - cornerRadius: Content radius, default is 25
    ///   - overlayColorWhenOpenMenu: Overlay of content when opening the Menu, default is Color.black.opacity(0.3)
    ///   - allowTapContentToCloseMenu: allow tap content to close, default is true
    ///   - showRightMenu: Open/Close right Menu's state
    ///   - allowSwipeToOpenMenu: Open/Close Menu by swipe gesture. default is true
    ///   - content: The View when Menu closed
    ///   - rightMenu: The right view when Menu is opening
    ///   - rightBackground: The right background of left Menu
    public init(rightStyle: SMKStyle = .classic,
                animation: Animation = .snappy(duration: 0.25, extraBounce: 0.1),
                rightMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5,
                cornerRadius: CGFloat = 25,
                overlayColorWhenOpenMenu: Color = Color.black.opacity(0.3),
                allowTapContentToCloseMenu: Bool = true,
                showRightMenu: Binding<Bool>,
                allowSwipeToOpenMenu: Binding<Bool> = .constant(true),
                content: @escaping () -> Content,
                rightMenu: @escaping () -> RightMenu) where LeftMenu == EmptyView, LeftBackground == EmptyView, RightBackground == EmptyView {
        self.leftMenu = { EmptyView() }
        self.leftBackground = EmptyView()
        self.rightBackground = EmptyView()

        self.rightStyle = rightStyle
        self.animation = animation
        self.leftMenuWidth = 0
        self.rightMenuWidth = min(rightMenuWidth, UIScreen.main.bounds.width)
        self.cornerRadius = cornerRadius
        self.overlayColorWhenOpenMenu = overlayColorWhenOpenMenu
        self.allowTapContentToCloseMenu = allowTapContentToCloseMenu
        self._showRightMenu = showRightMenu
        self._showLeftMenu = .constant(false)
        self._allowSwipeToOpenMenu = allowSwipeToOpenMenu
        self.content = content
        self.rightMenu = rightMenu
    }

    // MARK: - Body

    public var body: some View {
        GeometryReader {
            let size = $0.size
            SideMenuView(size: size)
                .contentShape(.rect)
                .simultaneousGesture(dragGesture)
                .onAppear {
                    actualScreenSize = size
                }
                .background {
                    if currentSide == .left {
                        leftBackground
                    } else if currentSide == .right {
                        rightBackground
                    }
                }
        }
        .ignoresSafeArea()
        .onChange(of: showLeftMenu, perform: { newValue in
            currentSide = .left
            withAnimation(animation) {
                if newValue {
                    showSideMenu()
                } else {
                    reset()
                }
            }
        })
        .onChange(of: showRightMenu, perform: { newValue in
            currentSide = .right
            withAnimation(animation) {
                if newValue {
                    showSideMenu()
                } else {
                    reset()
                }
            }
        })
    }
}
