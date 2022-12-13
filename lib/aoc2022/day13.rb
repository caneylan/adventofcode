
module Aoc2022
  class Day13 < Solution

    def parse_input
      @pairs = input.each_slice(3).map { |(left, right, _)| [eval(left), eval(right)] }
    end

    def pairs_sorted?(left, right)
      0.upto(left.length - 1) do |i|
        break if i >= right.length
        if left[i].is_a?(Integer) && right[i].is_a?(Integer)
          return -1 if left[i] < right[i]
          return 1 if left[i] > right[i]
        else
          l = left[i].is_a?(Array) ? left[i] : [left[i]]
          r = right[i].is_a?(Array) ? right[i] : [right[i]]
          rv = pairs_sorted?(l, r)
          return rv unless rv == 0
        end
      end
      return -1 if left.length < right.length
      return 1 if left.length > right.length
      return 0
    end

    def part1!
      @pairs.map.with_index { |p, i| pairs_sorted?(*p) < 0 ? i + 1 : 0 }.sum
    end

    def part2!
      div1 = [[2]]
      div2 = [[6]]
      all = [ div1, div2 ] + @pairs.flatten(1)
      all.sort! { |left, right| pairs_sorted?(left, right) }
      (all.index(div1) + 1) * (all.index(div2) + 1)
    end

  end
end

