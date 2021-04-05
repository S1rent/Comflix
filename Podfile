platform :ios, '14.0'
 
use_frameworks!
workspace 'Comflix'

target 'Comflix' do
  pod 'Alamofire'
  pod 'SwiftLint'
  pod 'SDWebImageSwiftUI'
  pod 'RealmSwift'
end
 
target 'Core' do
  project '../Core/Core'
  pod 'RealmSwift'
end

target 'Movie' do
  project '../Core/Core'
  project '../Movie/Movie'
  pod 'RealmSwift'
end
