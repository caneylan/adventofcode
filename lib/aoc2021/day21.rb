module Aoc2021
  class Day21 < Solution

    def part1!
      p1 = input[0].split.last.to_i - 1
      p2 = input[1].split.last.to_i - 1
      s1 = 0
      s2 = 0
      i = 0
      roll_count = 0
      loop do
        roll = i + 1 + i + 2 + i + 3
        i = (i + 3) % 100
        roll_count += 3
        p1 = (p1 + roll) % 10
        s1 += p1 + 1
        break if s1 >= 1000

        roll = i + 1 + i + 2 + i + 3
        i = (i + 3) % 100
        roll_count += 3
        p2 = (p2 + roll) % 10
        s2 += p2 + 1
        break if s2 >= 1000
      end
      return [s1, s2].min * roll_count
    end

    def count_wins(p1, s1, p2, s2, goal, cache)
      possible_rolls = {
        3 => 1,
        4 => 3,
        5 => 6,
        6 => 7,
        7 => 6,
        8 => 3,
        9 => 1,
      }
      p1_wins = 0
      p2_wins = 0
      possible_rolls.each do |roll_1, roll_count_1|
        new_p1 = (p1 + roll_1) % 10
        new_s1 = s1 + new_p1 + 1
        if new_s1 >= goal
          p1_wins += roll_count_1
        else
          possible_rolls.each do |roll_2, roll_count_2|
            new_p2 = (p2 + roll_2) % 10
            new_s2 = s2 + new_p2 + 1
            if new_s2 >= goal
              p2_wins += roll_count_1 * roll_count_2
            else
              wins = cache["#{new_p1},#{new_s1},#{new_p2},#{new_s2}"]
              if wins.nil?
                wins = count_wins(new_p1, new_s1, new_p2, new_s2, goal, cache)
                cache["#{new_p1},#{new_s1},#{new_p2},#{new_s2}"] = wins
              end
              p1_wins += wins[0] * roll_count_1 * roll_count_2
              p2_wins += wins[1] * roll_count_1 * roll_count_2
            end
          end
        end
      end
      return [p1_wins, p2_wins]
    end

    def part2!
      p1 = input[0].split.last.to_i - 1
      p2 = input[1].split.last.to_i - 1

      return count_wins(p1, 0, p2, 0, 21, {}).max
    end

  end
end
