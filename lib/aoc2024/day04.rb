
module Aoc2024
  class Day04 < Solution
    
    def part1!
      count = 0
      input.each_index do |y|
        input[y].each_index do |x|
          if input[y][x] == 'X'
            -1.upto(1) do |dy|
              -1.upto(1) do |dx|
                if y + 3*dy >= 0 && y + 3*dy < input.size && x + 3*dx >= 0 && x + 3*dx < input[y].size &&
                    input[y + dy][x + dx] == 'M' && input[y + 2*dy][x + 2*dx] == 'A' && input[y + 3*dy][x + 3*dx] == 'S'
                  count += 1
                end
              end
            end
          end
        end
      end
      count
    end

    def part2!
      count = 0
      input.each_index do |y|
        input[y].each_index do |x|
          if input[y][x] == 'A' &&
               x - 1 >= 0 && x + 1 < input[y].size && y - 1 >= 0 && y + 1 < input.size &&
               (input[y - 1][x - 1] == 'M' && input[y + 1][x + 1] == 'S' || input[y - 1][x - 1] == 'S' && input[y + 1][x + 1] == 'M') &&
               (input[y - 1][x + 1] == 'M' && input[y + 1][x - 1] == 'S' || input[y - 1][x + 1] == 'S' && input[y + 1][x - 1] == 'M')
             count += 1
          end
        end
      end
      count
    end

  end
end

