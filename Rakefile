host = 'apple-tv.local'

desc 'Fetches the latest AppleTV process crash log and makes Xcode symbolicate it'
task :log do
  latest = `ssh #{host} 'ls -t -r /var/mobile/Library/Logs/CrashReporter/AppleTV_* | tail -n 1'`.strip
  tmp = File.join('/tmp', File.basename(latest))
  sh "scp #{host}:#{latest} #{tmp}"

  logs_dir = File.expand_path('~/Library/Logs/CrashReporter/MobileDevice/AppleTV')
  mkdir_p logs_dir
  destination = File.join(logs_dir, "#{File.basename(latest, '.plist')}.crash")

  # PlistBuddy returns an empty string for `description`.
  replace = '"Process:         AppleTV", "Process:         Gemist"'
  `/usr/bin/ruby -rosx/cocoa -e 'plist = OSX::NSDictionary.dictionaryWithContentsOfFile("#{tmp}"); puts plist["description"].sub(#{replace})' > #{destination}`

  system %{osascript -e 'tell application "Xcode" to activate'}
end

namespace :plist do
  plist = '/var/mobile/Library/Preferences/nl.superalloy.Gemist.plist'

  desc 'Create local copy of the remote plist store'
  task :backup do
    sh "scp #{host}:#{plist} ."
  end

  desc 'Remove remote plist store'
  task :remove do
    puts "[!] Are you sure you want to remove the remote plist store? [y/n]"
    if $stdin.gets.chomp.downcase == 'y'
      sh "ssh #{host} 'rm #{plist}'"
    end
  end

  desc 'Restore plist store from backup'
  task :restore do
    sh "scp #{File.basename(plist)} #{host}:#{File.dirname(plist)}"
  end
end

begin
  require 'xcodebuild'

  XcodeBuild::Tasks::BuildTask.new(:debug) do |t|
    t.workspace = "UitzendingGemist.xcworkspace"
    t.scheme = "Gemist"
    t.configuration = "Debug"
    t.arch = "armv7"
    t.add_build_setting('ONLY_ACTIVE_ARCH', 'NO')
    t.add_build_setting('ATV_DEPLOY_TO_DEVICE', 'NO')
    t.formatter = XcodeBuild::Formatters::ProgressFormatter.new
  end
rescue LoadError
  puts 'Disabling build tasks.'
end

namespace :deb do
  task :create => ['debug:clean', 'debug:build'] do
    product_name = 'Gemist.frappliance'
    product_dir  = `xcodebuild -workspace UitzendingGemist.xcworkspace -scheme Gemist -showBuildSettings | grep '\\bBUILT_PRODUCTS_DIR\\b'`
    product_dir  = product_dir.split('=').last.strip
    product_path = File.join(product_dir, product_name)

    version_dir = 'deb/Gemist_0.9.0-1_iphoneos-arm'
    cp_r('deb/Gemist.frappliance', version_dir)

    destroot = File.join(version_dir, 'Applications/AppleTV.app/Appliances')
    mkdir_p(destroot)
    cp_r(product_path, destroot)

    env = 'PERL5LIB=/opt/local/Cellar/dpkg/1.15.8.13 COPYFILE_DISABLE=1 COPY_EXTENDED_ATTRIBUTES_DISABLE=1'
    sh "env #{env} dpkg-deb -b #{version_dir}"
    mkdir_p "deb/repo/debs"
    mv "#{version_dir}.deb", "deb/repo/debs"
    sh "cd deb/repo && env #{env} dpkg-scanpackages -m . /dev/null > Packages"
    sh "cd deb/repo && bzip2 Packages"

    sh "cd deb && tar -zcvf repo.tar.gz repo"
  end
end
