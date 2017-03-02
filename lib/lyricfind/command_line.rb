require 'optparse'

class CommandLine
  def self.do_verbose options
    options
  end

  def self.do_something arg
    42
  end

  def self.run(argv)
    options = parse(argv)
    return do_something(options[:file]) if options[:file]
    return do_verbose(options) if options[:verbose]
  end

  def self.parse(argv)
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end

      opts.on("-f", "--file FILE", "Run file") do |f|
        options[:file] = f
      end
    end.parse! argv
    options
  end
end
