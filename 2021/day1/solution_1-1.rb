#!/usr/bin/ruby

input_filename = ARGV.first
raise "usage: #{$0} <input_filename>" unless input_filename

previous = nil
n_increased = 0
File.foreach(input_filename) do |line|
  current = line.to_i
  if previous && current > previous
    n_increased += 1
  end
  previous = current
end
puts n_increased

