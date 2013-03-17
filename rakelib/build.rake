begin
  require 'rubygems'
  require 'bundler'
  Bundler.setup
  require 'xcodebuild'

  XcodeBuild::Tasks::BuildTask.new(:debug) do |t|
    t.workspace = "UitzendingGemist.xcworkspace"
    t.scheme = "Gemist"
    t.configuration = "Debug"
    t.arch = "armv7"
    t.add_build_setting('ONLY_ACTIVE_ARCH', 'NO')
    t.add_build_setting('ATV_DEPLOY_TO_DEVICE', 'NO')
    t.formatter = XcodeBuild::Formatters::ProgressFormatter.new
    t.create_clang_compile_db = true
  end

  namespace :deb do
    task :create => [:clean, 'debug:build'] do
      product_name = 'Gemist.frappliance'
      product_dir  = `xcodebuild -workspace UitzendingGemist.xcworkspace -scheme Gemist -showBuildSettings | grep '\\bBUILT_PRODUCTS_DIR\\b'`
      product_dir  = product_dir.split('=').last.strip
      product_path = File.join(product_dir, product_name)

      version = `/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' Gemist/Gemist-Info.plist`.strip
      version = "#{version}-1" # I have no clue, some deb version thing...
      version_dir = "deb/Gemist_#{version}_iphoneos-arm"

      control_file_dir = File.join(version_dir, 'DEBIAN')
      mkdir_p(control_file_dir)
      File.open(File.join(control_file_dir, 'control'), 'w') do |control|
        control.write File.read('deb/Gemist.frappliance/DEBIAN/control').sub(/CURRENT-VERSION/, version)
      end

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

      sh "scp deb/repo.tar.gz apt.superalloy.nl:~/"

      puts "[!] Now upload the symbols to HockeyApp: #{File.join(product_dir, 'Gemist.frappliance.dSYM')}"
    end
  end

  desc 'Clean all build artifacts'
  task :clean do
    rm_rf 'DerivedData'
    rm_rf 'deb/Gemist_*_iphoneos-arm'
    rm_f 'deb/repo.tar.gz'
    rm_f 'deb/repo/Packages.bz2'
    rm_f 'compile_commands.json'
  end

rescue LoadError
  puts 'Disabling build tasks.'
end
