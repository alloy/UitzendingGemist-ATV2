namespace :store do
  plist = '/var/mobile/Library/Preferences/nl.superalloy.Gemist.plist'

  desc 'Create local copy of the remote plist store'
  task :backup do
    sh "scp #{DEVICE_HOSTNAME}:#{plist} ."
  end

  desc 'Remove remote plist store'
  task :remove do
    puts "[!] Are you sure you want to remove the remote plist store? [y/n]"
    if $stdin.gets.chomp.downcase == 'y'
      sh "ssh #{DEVICE_HOSTNAME} 'rm #{plist}'"
    end
  end

  desc 'Restore plist store from backup'
  task :restore do
    sh "scp #{File.basename(plist)} #{DEVICE_HOSTNAME}:#{File.dirname(plist)}"
  end
end
