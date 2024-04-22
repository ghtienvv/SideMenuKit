# SideMenuKit
### EasySideMenu has been moved and renamed: SideMenuKit
![Group 13428](https://github.com/tienvv88/SideMenuKit/assets/39039138/00d0f544-4068-484a-8efb-2004fdf6b339)


## Requirements
Swift 5.x, iOS 15+

## Installation
### Cocoapods
SideMenuKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SideMenuKit'
```
### Swift Package Manager
1. File > Swift Packages > Add Package Dependency
2. Add ```https://github.com/ghtienvv/SideMenuKit.git```
   
OR

Update ```dependencies``` in ```Package.swift```
```ruby
dependencies: [.package(url: "[https://github.com/ghtienvv/SideMenuKit.git]", .upToNextMajor(from: "0.0.2"))]
```

## Demo
| Side/Style  | classic  | rotation3D (flipOutside) | rotation3D (flipInside) | clipToCenter | clipToCorner (bottom) | clipToCorner (top) | pourToLeft | pourToRight |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|  left |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/1977cfdd-319f-4f38-8827-afbf561d0b90" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/fab52147-a447-45be-8fb2-b233e0c1a2de" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/7e5063a3-a062-4a76-85f0-78f82f128a27" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/49784521-330d-4491-99b6-5fe75a3ae551" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/3f780624-71d2-4eff-913b-f308d93f404f" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/bb624734-f167-448f-befa-49fddaae4156" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/68e53e45-276c-4395-b45d-4b7b792e3b61" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/7a9513db-fab4-4a26-aa84-c44bbaadfbcd" width="80"/> |
|  right |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/aa62baf1-d31c-4c1c-bfb0-dad6eb7d20de" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/a8bb1eb5-0c9c-4a21-9623-971c858d0fd2" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/c15a08f6-4031-42e6-a422-69b6c70baa8f" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/276d218c-523c-42a2-bb49-ffd3c37cf70f" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/3e9856fd-db5e-4360-b6a2-6a7782898aff" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/77bd13cd-f6f2-4210-8c06-d4906962d668" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/6b367946-9f3b-4cf0-85dd-13f377f0ac3f" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/123f5063-8f5b-49c2-b978-97c3daa4469f" width="80"/> |
|  both |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/2cc279fc-bdd7-40f3-8e95-2e69193b9a49" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/4b6a9c6e-e878-44b4-ba2c-8d7615b206d9" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/98281772-ed87-4e0c-b7dd-77e6db9d4231" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/f2648356-f50d-4c91-b24e-464dd8ee4b56" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/ce46e592-8401-4429-8c6a-31dc3bed2e6a" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/9023d78d-5d39-4c46-b58e-e082b8989bc5" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/d29e3280-1d52-4ab2-831d-73981b293d45" width="80"/> |  <img src="https://github.com/tienvv88/EasySideMenu/assets/39039138/e9c30de9-4d48-43f5-9424-bdda276b75cd" width="80"/> |

## Example
To run the example project, clone or download the repo, and run `pod install` from the Example directory first.

## Parameters
### init SMKView
|  parameter  | value type | default value |
| ------------- | ------------- | ------------- |
| leftStyle | SMKSide  | ```.classic```  |
| rightStyle | SMKStyle  | ```.classic```  |
| animation  | Animation  | ```.snappy(duration: 0.25, extraBounce: 0.1)```  |
| leftMenuWidth  | CGFloat  | ```UIScreen.main.bounds.width * 0.5```  |
| rightMenuWidth  | CGFloat  | ```UIScreen.main.bounds.width * 0.5```  |
| cornerRadius  | CGFloat  | ```25```  |
| overlayColorWhenOpenMenu  | Color  | ```Color.black.opacity(0.3)```  |
| allowTapContentToCloseMenu  | Bool  | ```true```  |
| showLeftMenu | Binding<Bool>  | ```mandatory with left menu or both```  |
| showRightMenu | Binding<Bool>  | ```mandatory with right menu or both```  |
| allowSwipeToOpenMenu  | Binding<Bool>  | ```.constant(true)```  |
| content  | View  | ```mandatory```  |
| leftMenu  | View  | ```mandatory with left menu or both```  |
| leftBackground  | View  | ```optional```  |
| rightMenu  | View  | ```mandatory with right menu or both```  |
| rightBackground  | View  | ```optional```  |

### SMKStyle
| Style  | parameter | value range |
| ------------- | ------------- | ------------- |
| classic  |  -- | --  |
| rotation3D  | - flip: SMKRotation3DStyle (flipOutside, flipInside) <br /> - rotation: CGFloat  | ```rotation: 0 -> 90``` |
| pourToRight  | --  | --  |
| pourToLeft  | --  | --  |
| clipToCorner  | side: SMKClipToCorner (top, bottom), offsetY  | ```offsetY: 100 -> (UIScreen.main.bounds.width / 2)```  |
| clipToCenter  | contentHeight: CGFloat  | ```contentHeight: (UIScreen.main.bounds.height / 3) -> UIScreen.main.bounds.height```  |

## Usage
### SwiftUI
#### Left Menu
```
import SwiftUI
import SideMenuKit

struct SwiftUIRootView: View {

    @State private var isShowLeftMenu: Bool = false
    @State private var isShowRightMenu: Bool = false

    private var leftStyle: SMKStyle = .classic
    private var rightStyle: SMKStyle = .classic

    var body: some View {
        LeftMenu()
    }

    @ViewBuilder
    private func LeftMenu() -> some View {
        SKMView(
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
}

#Preview {
    SwiftUIRootView()
}
```
#### Right Menu
```
import SwiftUI
import SideMenuKit

struct SwiftUIRootView: View {

    @State private var isShowLeftMenu: Bool = false
    @State private var isShowRightMenu: Bool = false

    private var leftStyle: SMKStyle = .classic
    private var rightStyle: SMKStyle = .classic

    var body: some View {
        RightMenu()
    }

    @ViewBuilder
    private func RightMenu() -> some View {
        SKMView(
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
}

#Preview {
    SwiftUIRootView()
}
```
#### Both Menu
```
import SwiftUI
import SideMenuKit

struct SwiftUIRootView: View {

    @State private var isShowLeftMenu: Bool = false
    @State private var isShowRightMenu: Bool = false

    private var leftStyle: SMKStyle = .classic
    private var rightStyle: SMKStyle = .classic

    var body: some View {
        BothMenu()
    }

    @ViewBuilder
    private func BothMenu() -> some View {
        SKMView(
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
```

## Contributing
We always appreciate contributions from the community. To make changes to the project, you can clone the repo and open ```Package.swift```. This package includes:
- Sources/SideMenuKit/SMKEntity.swift
- Sources/SideMenuKit/SMKView.swift
- Sources/SideMenuKit/SMKView+UI.swift
- Sources/SideMenuKit/SMKView+Calculator.swift
- Sources/SideMenuKit/SMKView+Control.swift
- Sources/SideMenuKit/SMKView+Gesture.swift
  
Please thoroughly test all changes and create an MR according to the template, we will review it as soon as possible

## Author

ghtienvv, it.tienvv@gmail.com

## License

SideMenuKit is available under the MIT license. See the [LICENSE](https://github.com/ghtienvv/SideMenuKit?tab=MIT-1-ov-file) file for more info.
