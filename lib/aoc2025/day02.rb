
module Aoc2025
  class Day02 < Solution

    def parse_input
      @ranges = input.first.split(',').map { |t| t.split('-').map(&:to_i) }
    end

    def invalid?(i)
      s = i.to_s
      if s.length % 2 == 0
        h = s.length / 2
        left = s[0...h]
        right = s[h..-1]
        return i if left == right
      end
      0
    end

    def hella_invalid?(i)
      s = i.to_s
      2.upto(s.length) do |n|
        if s.length % n == 0
          part_len = s.length / n
          first_part = nil
          good = true
          n.times do |i|
            if first_part
              unless first_part == s[i * part_len, part_len]
                good = false
                break
              end
            else
              first_part = s[i * part_len, part_len]
            end
          end
          return i if good
        end
      end
      0
    end

    def part1!
      @ranges.sum do |a, b|
        a.upto(b).sum do |i|
          invalid?(i)
        end
      end
    end

    def part2!
      @ranges.sum do |a, b|
        a.upto(b).sum do |i|
          hella_invalid?(i)
        end
      end
    end

  end
end

