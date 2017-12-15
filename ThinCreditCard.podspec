#
# Be sure to run `pod lib lint ThinCreditCard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ThinCreditCard'
  s.version          = '0.1.1'
  s.summary          = 'Simple way to add a credit card.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Simple way to add a credit card. All written from scratch without any dependency.
                       DESC

  s.homepage         = 'https://github.com/tsarikovskiy/ThinCreditCard'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tsarikovskiy' => 's.tsarikovskiy@nullgr.com' }
  s.source           = { :git => 'https://github.com/tsarikovskiy/ThinCreditCard.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/s_tsarikovskiy'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ThinCreditCard/Classes/**/*'
  
  s.resource_bundles = {
    'ThinCreditCard' => ['ThinCreditCard/Assets/**/*.png']
  }

  s.resources = "ThinCreditCard/Assets/*.xcassets"
  s.frameworks = 'UIKit'
end
