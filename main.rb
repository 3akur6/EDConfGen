require 'slop'
require 'colorize'
begin
  require_relative 'generator'
rescue LoadError => e
  puts e
  puts 'Error exit.'
  exit
end

opts = Slop.parse do |o|
  o.string '-c', '--config', 'configuration file (json only)'
  o.string '-o', '--output', 'C header file name generated (default: gpio_config.h)', default: 'gpio_config.h'
end

if ARGV.empty?
  puts opts
  exit
end

output_name = opts[:output]
output = output_name.end_with?('.h') ? output_name : "#{output_name}.h"
if File.exist?(output)
  puts "#{output.colorize(:bold)} has already existed"
  output = "#{output.sub(/\.h$/, '')}_new.h"
  puts "change to #{output.colorize(:yellow)}"
end

config_name = opts[:config]
config = config_name.end_with?('.json') ? config_name : "#{config_name}.json"
unless File.exist?(config)
  puts "#{config.colorize(:bold)} does not exist, please check."
  puts 'Error exit.'
  exit
end

begin
  gen = Generator.new(config)
  result = gen.result
rescue JSON::ParserError
  puts "mistakes in #{config}"
  puts 'Error exit.'
  exit
rescue Errno::ENOENT => e
  puts e
  puts 'Error exit.'
  exit
end

File.write(output, result)
puts "Successfully save to #{File.absolute_path(output).colorize(:blue)}"
