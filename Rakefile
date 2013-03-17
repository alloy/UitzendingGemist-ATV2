DEVICE_HOSTNAME = 'apple-tv.local'

desc 'Start PonyDebugger server'
task :ponyd do
  sh 'ponyd serve --listen-interface=0.0.0.0'
end

task :default => :console
