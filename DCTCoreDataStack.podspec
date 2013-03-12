Pod::Spec.new do |s|
  s.name         = "DCTCoreDataStack"
  s.version      = "1.0"
  s.summary      = "Easily sets up a read to use core data stack"
  s.homepage     = "https://github.com/danielctull/DCTCoreDataStack"

  # Specify the license type. CocoaPods detects automatically the license file if it is named
  # 'LICENCE*.*' or 'LICENSE*.*', however if the name is different, specify it.
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

  s.author       = { "Daniel Tull" => "dt@danieltull.co.uk" }
  s.source       = { :git => "https://github.com/danielctull/DCTCoreDataStack.git", :tag => "1.0" }
  s.platform     = :ios, '5.0'
  s.source_files = 'DCTCoreDataStack'
  s.framework    = 'CoreData'
  s.requires_arc = true
end
