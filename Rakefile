require 'erb'
require 'fileutils'

HOME = '/tmp/dot' #RUBY_PLATFORM =~ /win32/i ? ENV['HOMEPATH'] : ENV['HOME']

desc "install dotfiles in home path"
task :install do
  puts "Installing dotfiles..."
  Dir['src/*'].each do |fname|
    puts "#{fname} => #{File.join(HOME, ".#{File.basename(fname)}")}"
    if File.directory?(fname)
      FileUtils.cp_r fname, File.join(HOME, File.basename(fname)),
                     :remove_destination => true
    else
	    File.open(File.join(HOME, ".#{File.basename(fname)}"), 'w') do |f|
	      f.write(ERB.new(IO.read(fname)).result)
	    end
    end
  end
  puts "DONE."
end

task :default => :install
