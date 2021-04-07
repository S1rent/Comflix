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
  pod 'Alamofire'
end

target 'Profile' do
  project '../Core/Core'
  project '../Profile/Profile'
end

target 'Home' do
  project '../Movie/Movie'
  project '../Home/Home'
  pod 'RealmSwift'
end

target 'Detail' do
  project '../Movie/Movie'	
  project '../Detail/Detail'
  pod 'SDWebImageSwiftUI'
end

target 'Favorite' do
  project '../Movie/Movie'
  project '../Favorite/Favorite'
  pod 'SDWebImageSwiftUI'
end
