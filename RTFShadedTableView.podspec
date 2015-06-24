#
# Be sure to run `pod lib lint RTFShadedTableView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RTFShadedTableView"
  s.version          = "0.1.0"
  s.summary          = "Clear (app) like category for UITableView providing consecutively shaded cell backgrounds"
  s.description      = <<-DESC
                       Like Clear, the to-do list manager for iOS, RTFShadedTableView creates consecutively shaded UITableViewCell background colors.
                       DESC
  s.homepage         = "https://github.com/MaxKramer/RTFShadedTableView"
  s.screenshots        = "https://raw.githubusercontent.com/MaxKramer/RTFShadedTableView/master/Screenshot.png"
  s.license          = 'MIT'
  s.author           = { "Max Kramer" => "max@maxkramer.co" }
  s.source           = { :git => "https://github.com/MaxKramer>/RTFShadedTableView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/maxkramer'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RTFShadedTableView' => ['Pod/Assets/*.png']
  }
end
