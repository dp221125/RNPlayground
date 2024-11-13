# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'
require_relative 'react-native-playground/node_modules/react-native/scripts/react_native_pods'
prepare_react_native_project!
ENV["REACT_NATIVE_NODE_MODULES_DIR"] = File.expand_path("react-native-playground/node_modules/", __dir__)
use_frameworks!

def autolink_Native_Modules(packages_to_skip = [])
  Dir.chdir('react-native-playground') do
    reactConfig = list_native_modules!(['npx', 'react-native', 'config', '--platform', 'ios'])
    packages = reactConfig[:ios_packages]
    find_package = []

    packages.each do |package|
        package_name = package[:name]
        unless packages_to_skip.any? { |pkg| package_name.include?(pkg) }
          find_package.append(package) 
      end
    end

    reactConfig[:ios_packages] = find_package
    link_native_modules!(reactConfig)
  end
end

target 'RNPlayground' do

  autolink_Native_Modules

  use_react_native!(
    :path => "react-native-playground/node_modules/react-native",
    fabric_enabled: true,
    new_arch_enabled: true,
    :app_path => "react-native-playground"
  )
end

post_install do |installer|
  react_native_post_install(
    installer,
    'react-native-playground/node_modules/react-native',
    :mac_catalyst_enabled => false,
  )
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
     config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = 15.0
    end
  end
end