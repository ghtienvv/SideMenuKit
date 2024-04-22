# SideMenuKit
![320744246-00d0f544-4068-484a-8efb-2004fdf6b339](https://github.com/ghtienvv/SideMenuKit/assets/167219931/437b493d-7e47-4352-be88-0ff408985677)


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
|  left |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/2e664a67-8ebf-4e85-8c8a-2e1a2178651d" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/646e9fa7-c65d-425c-9fd5-508bfb40c10b" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/b60d594c-82f8-4587-98b0-27e2179e06eb" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/7ef47181-0f51-4971-8295-3e5541a83aec" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/978b2aae-96d6-4695-b24b-ecddef572b31" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/d5fcecea-e019-415b-ba7b-ea9ffba99407" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/6281abb7-c251-4a5f-a7b6-61976604a48f" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/16c83331-b1d7-45b7-8dea-d34209c56c77" width="80"/> |
|  right |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/68d8c332-1adf-444d-a249-e0b3c6264594" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/5208c94e-c51d-49e0-8fec-00e5372c38a5" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/d1342547-0686-4871-8673-d9dbff250b60" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/8a29c3d0-1740-45bb-a453-ccaa2a8e8f22" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/950fa68c-8b21-405f-8364-b68744c2154d" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/14d37281-b7c4-4a14-8e6b-f18ae28802f7" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/e30f2ad6-d344-4d49-9236-39798c66dca1" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/5aa178e4-c1bf-49b2-b8cf-623c9b520532" width="80"/> |
|  both |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/790f385e-1f09-4d60-a89b-7ed6f8aa85ea" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/b9e12339-43b3-4189-bf88-c752660967e5" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/b0376157-33eb-4a1b-a050-815f1c9ceb40" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/26319189-efbb-4ce1-a050-bec00beb19d3" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/254ae66a-d04b-4751-84ed-64a531b0beb9" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/4da5de3d-447f-45ed-8055-0ea4ccbc24f7" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/15c4e7c9-b7c5-4afe-90a3-f5c3dd67c528" width="80"/> |  <img src="https://github.com/ghtienvv/SideMenuKit/assets/167219931/8a66f013-e777-40ee-8dea-2741c57f6441" width="80"/> |

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
