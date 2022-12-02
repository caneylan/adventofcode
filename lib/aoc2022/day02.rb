
module Aoc2022
  class Day02 < Solution

    @@beat_map = {
      'A' => 'C',
      'B' => 'A',
      'C' => 'B',
    }

    @@beat_by_map = @@beat_map.invert

    def score_matchup(theirs, yours)
      if theirs == yours
        3
      elsif @@beat_map[yours] == theirs
        6
      else
        0
      end
    end

    def score_round(theirs, yours)
      yours.ord - 64 + score_matchup(theirs, yours)
    end

    def part1!
      input.map { |line| a, b = line.split ; score_round(a, (b.ord - 23).chr) }.sum
    end

    def part2!
      input.map do |line|
        theirs, outcome = line.split
        yours = if outcome == 'X'    # lose
                  @@beat_map[theirs]
                elsif outcome == 'Y' # draw
                  theirs
                else                 # win
                  @@beat_by_map[theirs]
                end
        score_round(theirs, yours)
      end.sum
    end

  end
end

