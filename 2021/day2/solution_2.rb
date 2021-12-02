#!/usr/bin/ruby

input_filename = ARGV.first
raise "usage: #{$0} <input_filename>" unless input_filename

x = y = aim = 0
File.foreach(input_filename) do |line|
  direction, n = line.split
  case direction
  when 'forward'
    x += n.to_i
    y += aim * n.to_i
  when 'up'
    aim -= n.to_i
  when 'down'
    aim += n.to_i
  end
end
puts x * y

