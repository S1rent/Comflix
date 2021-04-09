
Pod::Spec.new do |s|
s.platform = :ios
s.ios.deployment_target = '14.0'
s.name = "Core"
s.summary = "Dicoding Core.framework for modularization chapter"
s.requires_arc = true
s.version = "1.0.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Philip Indra Prayitno" => "philip.prayitno@gmail.com" }
s.homepage = "https://github.com/S1rent/Dicoding-Core"
s.source = { :git => "https://github.com/S1rent/Dicoding-Core.git", :tag => "#{s.version}" }
s.framework = "UIKit"
s.source_files = "Core/**/*.{swift,h,m}"
s.exclude_files = "Core/**/*.plist"
s.swift_version = "5.1"
end