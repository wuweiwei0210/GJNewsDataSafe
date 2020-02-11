#
# Be sure to run `pod lib lint GJNewsDataSafe.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GJNewsDataSafe'
  s.version          = '0.1.0'
  s.summary          = '用于校验服务器返回数据的安全性'

  s.homepage         = 'https://github.com/wuweiwei0210/GJNewsDataSafe.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wuweiwei' => '846591806@qq.com' }
  s.source           = { :git => 'https://github.com/wuweiwei0210/GJNewsDataSafe.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GJNewsDataSafe/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GJNewsDataSafe' => ['GJNewsDataSafe/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
