
module Aoc2023
  class Day03 < Solution

    def part1!
      sum = 0
      input.each_with_index do |line, line_i|
        nums = []
        line.scan(/\d+/) do |num|
          nums << [num, Regexp.last_match.offset(0)[0]]
        end
        nums.each do |(num_s, num_i)|
          (line_i - 1).upto(line_i + 1) do |y|
            next unless y >= 0 && y < input.length
            (num_i - 1).upto(num_i + num_s.length) do |x|
              next unless x >= 0 && x < line.length
              if input[y][x] !~ /[\d\.]/
                sum += num_s.to_i  # a bad assumption that turned out to be true
              end
            end
          end
        end
      end
      return sum
    end

    def part2!
      gears = Hash.new { |h, k| h[k] = [] }
      input.each_with_index do |line, line_i|
        nums = []
        line.scan(/\d+/) do |num|
          nums << [num, Regexp.last_match.offset(0)[0]]
        end
        nums.each do |(num_s, num_i)|
          (line_i - 1).upto(line_i + 1) do |y|
            next unless y >= 0 && y < input.length
            (num_i - 1).upto(num_i + num_s.length) do |x|
              next unless x >= 0 && x < line.length
              if input[y][x] == '*'
                gears["#{x},#{y}"] << num_s.to_i
              end
            end
          end
        end
      end
      sum = 0
      gears.each do |coord, nums|
        if nums.length == 2
          sum += nums[0] * nums[1]
        end
      end
      return sum
    end

  end
end

