require 'erb'
require 'fileutils'

HOME = RUBY_PLATFORM =~ /win32/i ? ENV['HOMEPATH'] : ENV['HOME']

desc "install dotfiles in home path"
task :install do
  puts "Installing dotfiles..."
  Dir['src/*'].each do |fname|
    dir = File.join(HOME, ".#{File.basename(fname)}")
    puts "#{fname} => #{dir}"
    if File.directory?(fname)
      FileUtils.cp_r fname, dir, :remove_destination => true
    else
	    File.open(File.join(HOME, ".#{File.basename(fname)}"), 'w') do |f|
	      f.write(ERB.new(IO.read(fname)).result)
	    end
    end
  end
  puts "DONE."
end

task :default => :install
