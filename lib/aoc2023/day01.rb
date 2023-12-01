
module Aoc2023
  class Day01 < Solution

    def part1!
      input.map do |line|
        nums = line.chars.grep(/^\d+$/).join
        "#{nums[0]}#{nums[-1]}".to_i
      end.sum
    end

    def start_num(s)
      return s[0] if s[0] =~ /[1-9]/
      words = {
        'one' => '1',
        'two' => '2',
        'three' => '3',
        'four' => '4',
        'five' => '5',
        'six' => '6',
        'seven' => '7',
        'eight' => '8',
        'nine' => '9',
      }.each do |w, n|
        return n if s.start_with?(w)
      end
      nil
    end

    def part2!
      input.map do |line|
        first_n = nil
        last_n = nil
        0.upto(line.length - 1) do |i|
          first_n = start_num(line[i..-1]) and break
        end
        (line.length - 1).downto(0) do |i|
          last_n = start_num(line[i..-1]) and break
        end
        "#{first_n}#{last_n}".to_i
      end.sum
    end

  end
end

