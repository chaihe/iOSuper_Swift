platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

target 'iOSuper' do
pod 'Alamofire', '~> 3.0'
pod "NSLogger"
pod 'FDFullscreenPopGesture', '~> 1.1'
pod 'FDStackView', '~> 1.0'
pod 'Bugly'
pod 'SwiftyJSON', '~> 2.3.2'
pod 'MJRefresh', '~> 3.1.0'
pod 'YYWebImage', '1.0.3'
pod 'SVProgressHUD', '~> 2.0.3'
pod 'RxSwift',    '~> 2.0'
pod 'RxCocoa',    '~> 2.0'
pod 'Reveal-iOS-SDK', :configurations => ['Debug']
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ARCHS'] = 'armv7 arm64'
            config.build_settings['SWIFT_VERSION'] = '2.3'
            config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
        end
    end
end
