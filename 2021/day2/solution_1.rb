#!/usr/bin/ruby

input_filename = ARGV.first
raise "usage: #{$0} <input_filename>" unless input_filename

x = y = 0
File.foreach(input_filename) do |line|
  direction, n = line.split
  case direction
  when 'forward'
    x += n.to_i
  when 'up'
    y -= n.to_i
  when 'down'
    y += n.to_i
  end
end
puts x * y

