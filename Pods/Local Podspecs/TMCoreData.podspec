Pod::Spec.new do |s|
  s.name         = "TMCoreData"
  s.version      = "0.0.1"
  s.summary      = ""
  s.homepage     = "https://github.com/tonymillion/TMCoreData"

  # Specify the license type. CocoaPods detects automatically the license file if it is named
  # `LICEN{C,S}E*.*', however if the name is different, specify it.
  s.license      = 'MIT (example)'
  # s.license      = { :type => 'MIT (example)', :file => 'FILE_LICENSE' }
  #
  # Only if no dedicated file is available include the full text of the license.
  #
  # s.license      = {
  #   :type => 'MIT (example)',
  #   :text => <<-LICENSE
  #             Copyright (C) <year> <copyright holders>

  #             All rights reserved.

  #             Redistribution and use in source and binary forms, with or without
  #             ...
  #   LICENSE
  # }

  s.author       = { "Tony Million" => "tonymillion@gmail.com" }
  s.source       = { :git => "https://github.com/tonymillion/TMCoreData.git",
                     :commit => "3aedfbe356fd43de8a0ae20e65537f409926fdb2" }
  # s.platform     = :ios, '5.0'
  s.source_files = 'TMCoreData/**/*.{h,m}'
  s.framework  = 'CoreData'
  s.requires_arc = true
end
