Pod::Spec.new do |s|
s.name         = "FNV"
s.version      = "1.0.0"
s.summary      = "FNV Hash Algorithm by Swift."
s.homepage     = "https://github.com/daisuke-t-jp/FNV"
s.license      = "MIT"
s.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }

s.requires_arc = true
s.swift_version  = "4.2"
s.ios.deployment_target = "10.0"
s.osx.deployment_target = "10.12"

s.source       = { :git => "https://github.com/daisuke-t-jp/FNV.git", :tag => s.version }
s.source_files  = 'FNV/FNV/*.{h,swift}'
end
