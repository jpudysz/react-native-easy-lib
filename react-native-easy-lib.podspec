require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]
  s.platforms    = { :ios => "12.4" }
  s.swift_version  = '5.4'
  s.source       = { :git => "https://github.com/jpudysz/react-native-easy-lib.git", :tag => "#{s.version}" }
  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'SWIFT_COMPILATION_MODE' => 'wholemodule',
    "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "EasyLibPackage-Swift.h"
  }

  s.dependency "React"
  s.dependency "React-Core"
end
