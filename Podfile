# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

def pods
  pod 'ESPullToRefresh', '2.9.3'
  pod 'Parchment', '3.1.0'
  pod 'IQKeyboardManagerSwift', '6.3.0'
  pod 'StringStylizer', '5.2.1'
  pod 'CRRefresh', '1.1.3'
  pod 'DatePickerDialog', '4.0'
  # pod 'DropDown', '2.3.2'
  pod 'PagingCollectionViewLayout', '0.0.4'
  pod 'SVGKit', '3.0.0'
  pod 'Alamofire', '5.10.2'
  # pod 'ImageLoader', '~> 0.6.0'
end

target 'mova-stream-ios' do
    use_frameworks!
  pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15'
      xcconfig_path = config.base_configuration_reference.real_path
      xcconfig = File.read(xcconfig_path)
      xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
      File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
    end
  end
end