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
