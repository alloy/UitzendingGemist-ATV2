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
