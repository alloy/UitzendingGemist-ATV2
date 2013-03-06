desc 'Open the Cycript console'
task :console do
  tmp = "/tmp/Cycript-AppleTV-Helpers.cy"
  cycript = "cycript -p AppleTV"
  helpers = File.join(File.dirname(__FILE__), File.basename(__FILE__, '.rake') + '.cy')
  # First copy and load the helpers
  system "cat #{helpers} | ssh #{DEVICE_HOSTNAME} 'cat > #{tmp}; #{cycript} #{tmp}'"
  # Then open console
  system "ssh -t #{DEVICE_HOSTNAME} '#{cycript}'"
end
