require 'erb'
require 'fileutils'
require 'digest'
require 'yaml'
require 'fileutils'
require './lib/dotfiles.rb'

HOME = RUBY_PLATFORM =~ /win32/i ? ENV['HOMEPATH'] : ENV['HOME']

desc "install dotfiles in home path"
task :install do
  if Dotfiles.installed?
    puts "dotfiles are already installed."
  else
    puts "==> Installing dotfiles..."
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
  
    Rake::Task[:checksum].execute
  end
end

desc "Install binaries"
task :bin do
  puts "==> Installing binaries..."
  Dir['./bin/*'].each do |f|
    next if File.directory? f
    sh "cp #{f} #{HOME}/bin"
    sh "chmod +x #{HOME}/bin/#{File.basename(f)}"
  end
  puts "DONE."
end

desc "generate checksum profile of files"
task :checksum do
  puts "Generating checksums..."
  Dotfiles::Sums.generate

  puts "writing file to #{Dotfiles::Sums::PATH}..."
  Dotfiles::Sums.save

  puts "DONE."
end

desc "clear dotfiles contained in the distribution from system"
task :clear do
  Dir.walk('src') do |file|
    f = file.sub('src/', "#{HOME}/.")
    sh "rm -rf #{f}" if File.exists?(f)
  end
  index = File.join(HOME, '.dotfiles')
  sh "rm -f #{index}"
end

namespace :vim do
  desc "Install vim configuration"
  task :all => [ :pathogen, :vundle, :install_plugins ]

  desc "Install pathogen"
  task :pathogen do
    path = "#{HOME}/.vim/autoload"
    FileUtils.mkpath path
    FileUtils.mkpath "#{HOME}/.vim/bundle"
    puts "Installing pathogen from Github..."
    sh 'git submodule update --init ext/vim/pathogen'
    sh "cp ext/vim/pathogen/autoload/pathogen.vim #{path}"
    puts 'done.'
  end

  desc "Install vundle"
  task :vundle => :pathogen do
    puts "Installing vundle from Github..."
    sh 'git submodule update --init ext/vim/vundle'
    sh "cp -r ext/vim/vundle #{HOME}/.vim/bundle"
    puts 'done.';
  end

  desc "Install vim plugins with vundle"
  task :install_plugins do
    sh "vim +BundleInstall +qall"
  end
end

task :default => [ :install, :bin, :"vim:all" ]
