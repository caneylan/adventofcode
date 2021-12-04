
module Aoc2021
  class Day3 < Solution

    def part1!
      mask = Array.new(input.first.length, 0)
      input.each do |line|
        line.each_char.with_index do |c, i|
          mask[i] += c.to_i
        end
      end

      gamma = mask.map { |i| i * 2 > input.length ? 1 : 0 }
      epsilon = gamma.map { |i| i == 1 ? 0 : 1}

      return gamma.join.to_i(2) * epsilon.join.to_i(2)
    end

    def part2!
      o2_rating = filter_data(input, 0) { |i, n| i * 2 >= n }
      co2_rating = filter_data(input, 0) { |i, n| i * 2 < n }
      return o2_rating * co2_rating
    end

    def filter_data(data, index, &match_block)
      what_we_have = data.map { |word| word[index].to_i }.sum
      what_we_want = match_block.call(what_we_have, data.length) ? 1 : 0
      what_we_got = data.select { |word| word[index].to_i == what_we_want }

      if what_we_got.length == 1
        return what_we_got.first.to_i(2)
      else
        return filter_data(what_we_got, index + 1, &match_block)
      end
    end

  end
end

