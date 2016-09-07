platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

target 'iOSuper' do
pod 'Alamofire', '~> 3.0'
pod "NSLogger"
pod 'FDFullscreenPopGesture', '~> 1.1'
pod 'FDStackView', '~> 1.0'
pod 'Bugly'
pod 'Reveal-iOS-SDK', :configurations => ['Debug']
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ARCHS'] = 'armv7 arm64'
        end
    end
end