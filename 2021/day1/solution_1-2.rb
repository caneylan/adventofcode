#!/usr/bin/ruby

input_filename = ARGV.first
raise "usage: #{$0} <input_filename>" unless input_filename

buffer = [nil, nil, nil]
n_increased = 0
File.foreach(input_filename) do |line|
  buffer << line.to_i
  if head = buffer.shift
    if head + buffer[0] + buffer[1] < buffer[0] + buffer[1] + buffer[2]
      n_increased += 1
    end
  end
end
puts n_increased

