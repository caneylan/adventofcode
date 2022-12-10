
module Aoc2022
  class Day10 < Solution

    def parse_input
      @cycles = [ [1, nil] ]
      input.each do |line|
        x = @cycles.last[0]
        if @cycles.last[1] == :addx
          x = x + @cycles.last[2]
        end

        case line
        when /^addx (-?\d+)$/
          @cycles << [x, :addx, $1.to_i]
          @cycles << [x, :addx, $1.to_i]
        when /^noop$/
          @cycles << [x, :noop]
        end
      end
    end

    def part1!
      [20, 60, 100, 140, 180, 220].map { |i| @cycles[i][0] * i }.sum
    end

    def part2!
      screen = Array.new(6) { "........................................" }
      1.upto(240) do |i|
        pixel_i = (i - 1) % 40
        pixel_row = (i - 1) / 40
        if pixel_i >= @cycles[i][0] - 1 && pixel_i <= @cycles[i][0] + 1
          screen[pixel_row][pixel_i] = '#'
        end
      end
      screen.join("\n") + "\n"
    end

  end
end

