#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint simple_count_down_timer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'simple_count_down_timer'
  s.version          = '1.0.7'
  s.summary          = 'A Simple Count Down Timer Widget'
  s.description      = <<-DESC
A Simple Count Down Timer Widget
                       DESC
  s.homepage         = 'https://github.com/Aky3108/simple_countdown_timer.git'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'simple_count_down_timer/Sources/simple_count_down_timer/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
