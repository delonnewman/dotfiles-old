require 'erb'
require 'fileutils'
require 'digest'
require 'yaml'

HOME = RUBY_PLATFORM =~ /win32/i ? ENV['HOMEPATH'] : ENV['HOME']

def Dir.walk(dir, &blk)
  if File.exists?(dir) and not File.directory?(dir)
    blk.call(dir)
  else
    Dir.entries(dir).each do |f|
      next if f == '.' || f == '..'
      path = File.join(dir, f)
      blk.call(path)
      Dir.walk(path, &blk)
    end
  end
end

module Dotfiles
  class Sums
    PATH = File.join(HOME, '.dotfiles')

	  def self.generate
		  @@sums = {}
		  Dir.walk('src') do |fname|
		    if not File.directory?(fname)
		      sum = Digest::SHA256.new.update(IO.read(fname)).to_s
		      @@sums[fname] = sum
		    end
		  end
	    @@sums['total'] = Digest::SHA256.new.update(@@sums.values.join('')).to_s
	    @@sums
	  end

    def self.save(path=PATH)
      generate unless @@sums
      File.open(path, 'w') do |f|
        f.write(@@sums.to_yaml)
      end
    end

    def self.load(path=PATH)
      if File.exists?(path)
        YAML.load_file(path)
      else
        {}
      end
    end
  end

	def self.installed?
    Sums.load['total'] == Sums.generate['total']
	end
end

desc "install dotfiles in home path"
task :install do
  if Dotfiles.installed?
    puts "dotfiles are already installed."
    exit
  end

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

  Rake::Task[:checksum].execute
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

task :default => :install
