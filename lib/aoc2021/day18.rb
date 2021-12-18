module Aoc2021
  class Day18 < Solution

    def explode_snail_num(snail_num)
      # find the first '[' nested under four other '['s
      stack = []
      snail_num.chars.each_with_index do |c, i|
        if c == '['
          stack << i
        elsif c == ']'
          stack.pop
        end
        break if stack.length == 5
      end
      return nil unless stack.length == 5
      nested_index = stack.last

      # left: everything before that '['; right: everything after it
      left_str = snail_num.slice(0, nested_index)
      right_str = snail_num.slice(nested_index + 1, snail_num.length)

      # left/right numbers in the pair being exploded
      nums = /(\d+),(\d+)(\])/.match(right_str)
      left_num = $1.to_i
      right_num = $2.to_i

      # the remaining string after the exploding pair
      right_str = right_str.slice(nums.begin(3) + 1, right_str.length)

      # update the first number to the left of the exploding pair, if there is one
      left_match = /(.*[\[,])(\d+)([^\d]*)$/.match(left_str)
      if left_match
        left_str = $1 + ($2.to_i + left_num).to_s + $3
      end

      # update the first number to the right of the exploding pair, if there is one
      right_match = /^([^\d]*)(\d+)(.*)$/.match(right_str)
      if right_match
        right_str = $1 + ($2.to_i + right_num).to_s + $3
      end

      return left_str + "0" + right_str
    end

    def split_snail_num(snail_num)
      # find the first number that's 10 or greater (i.e., any number composed of two or more digits)
      big_num_matches = /(\d{2,})/.match(snail_num)
      return nil unless big_num_matches
      big_num = $1.to_i

      # left: everyting before the big number; right: everything after it 
      left_str = snail_num.slice(0, big_num_matches.begin(1))
      right_str = snail_num.slice(big_num_matches.end(1), snail_num.length)

      return left_str + "[" + (big_num / 2).to_s + "," + (big_num.to_f / 2).round.to_s + "]" + right_str
    end

    def reduce_snail_num(snail_num)
      loop do
        # if we exploded, then restart the action loop
        exploded = explode_snail_num(snail_num)
        if exploded
          snail_num = exploded
          next
        end
        
        # if we splitted, then restart the action loop
        splitted = split_snail_num(snail_num)
        if splitted
          snail_num = splitted
          next
        end

        # we didn't do anything, so we're done now
        break
      end
      return snail_num
    end

    def snail_num_addition(snail_nums)
      snail_nums.reduce { |sum, num| reduce_snail_num("[#{sum},#{num}]") }
    end

    def snail_num_magnitude(snail_num)
      loop do
        # substitute number pairs with their magnitude
        snail_num = snail_num.gsub(/\[(\d+),(\d+)\]/) { |s| 3 * $1.to_i + 2 * $2.to_i }

        # keep doing this until there are no longer any pairs
        break unless snail_num[0] == '['
      end
      return snail_num.to_i
    end

    def part1!
      return snail_num_magnitude(snail_num_addition(input))
    end

    def part2!
      return input.permutation(2).to_a.map { |pair| snail_num_magnitude(snail_num_addition(pair)) }.max
    end

  end
end
