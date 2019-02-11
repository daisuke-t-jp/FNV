Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "FNV"
  spec.version      = "1.0.4"
  spec.summary      = "FNV hash framework in Swift."

  spec.description  = <<-DESC
                   This is "FNV" (Fowler/Noll/Vo) hash framework in Swift.

                   Framework include "FNV-0 32/64bit", "FNV-1 32/64bit", "FNV-1a 32/64bit" functions.
                   DESC

  spec.homepage     = "https://github.com/daisuke-t-jp/FNV"
  spec.screenshots  = "https://raw.githubusercontent.com/daisuke-t-jp/FNV/master/doc/header.png"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.12"
  spec.tvos.deployment_target = "12.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/daisuke-t-jp/FNV.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "FNV/FNV/*.{h,swift}"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.swift_version = "4.2"
  spec.requires_arc = true

end
