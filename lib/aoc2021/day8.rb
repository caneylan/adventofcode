module Aoc2021
  class Day8 < Solution
    @@code_map = {
      "abcefg" => "0",
      "cf" => "1",
      "acdeg" => "2",
      "acdfg" => "3",
      "bcdf" => "4",
      "abdfg" => "5",
      "abdefg" => "6",
      "acf" => "7",
      "abcdefg" => "8",
      "abcdfg" => "9",
    }

    def part1!
      output = input.map { |line| line.split(' | ')[1].split }.flatten
      return output.select { |o| [2, 4, 3, 7].include?(o.length) }.length
    end

    def part2!
      key = {}
      sum = 0
      input.each do |line|
        signals, output = line.split(' | ').map(&:split)

        #    .  .   .  aaa    aaa
        #    c  b   c     c  b   c
        #    .   ddd      .   ddd
        #    f      f     f  e   f
        #    .      .     .   ggg
        one = signals.select { |s| s.length == 2 }.first.chars
        four = signals.select { |s| s.length == 4 }.first.chars
        seven = signals.select { |s| s.length == 3 }.first.chars
        eight = signals.select { |s| s.length == 7 }.first.chars

        #  aaa   aaa    aaa
        #     c     c  b
        #  ddd   ddd    ddd
        # e         f      f
        #  ggg   ggg    ggg
        fivers = signals.select { |s| s.length == 5 }.map(&:chars)

        #  aaa    aaa    aaa
        # b   c  b      b   c
        # . .     ddd    ddd
        # e   f  e   f      f
        #  ggg    ggg    ggg
        sixers = signals.select { |s| s.length == 6 }.map(&:chars)

        a = seven - one
        bd = four - one
        bdeg = eight - seven
        eg = bdeg - bd

        adg = fivers.reduce(&:intersection)
        d = adg - a - eg
        b = bd - d
 
        #  ...   ...    ...
        #     c     c  .
        #  ...   ...    ...
        # e         f      f
        #  ggg   ggg    ggg
        g = fivers.map { |x| x - a - b - d }.reduce(&:intersection)
        e = eg - g
 
        #  ...    ...    ...
        # .   c  .      .   c
        # . .     ...    ...
        # .   f  .   f      f
        #  ...    ...    ...
        f = sixers.map { |x| x - a - b - d - e - g }.reduce(&:intersection)
        c = one - f

        key = {
          a.first => 'a',
          b.first => 'b',
          c.first => 'c',
          d.first => 'd',
          e.first => 'e',
          f.first => 'f',
          g.first => 'g',
        }

        num_s = ""
        output.each do |o|
          decoded_num = o.chars.map { |c| key[c] }.sort.join('')
          num_s += @@code_map[decoded_num]
        end
        sum += num_s.to_i
      end

      return sum
    end

  end
end
