#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint infra_did_dart.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'infra_did_dart'
  s.version          = '0.0.1'
  s.summary          = 'Infra DID Dart Library'
  s.description      = <<-DESC
  Infra DID Dart Library
                       DESC
  s.homepage         = 'https://bc-labs.net'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'InfraBlockchain' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.public_header_files = 'Classes**/*.h'
  s.source_files     = 'Classes/**/*'
  s.static_framework = true
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.11'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
