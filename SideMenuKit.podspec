Pod::Spec.new do |s|
  s.name             = 'SideMenuKit'
  s.version          = '0.1.12'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'Support some Side Menu type on iOS using SwiftUI'
  s.homepage         = 'https://github.com/ghtienvv/SideMenuKit'
  s.social_media_url = 'https://twitter.com/tienvv88'
  s.author           = { 'ghtienvv' => 'it.tienvv@gmail.com' }
  s.source           = { :git => 'https://github.com/ghtienvv/SideMenuKit.git', :tag => s.version }

  s.swift_version = '5.0'

  s.ios.deployment_target = '15.0'

  s.source_files = 'Sources/SideMenuKit/**/*'
end
