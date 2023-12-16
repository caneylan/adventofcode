
module Aoc2023
  class Day16 < Solution

    def parse_input
      @map = input.map { |line| line.chars }
      @y_max = @map.length - 1
      @x_max = @map[0].length - 1
    end

    def let_there_be_light(y, x, dy, dx)
      seen = {}
      q = [ [y, x, dy, dx] ]
      loop do
        break if q.empty?
        y, x, dy, dx = q.pop

        next if seen["#{y},#{x},#{dy},#{dx}"]
        seen["#{y},#{x},#{dy},#{dx}"] = true

        y = y + dy
        x = x + dx
        next if x < 0 || x > @x_max || y < 0 || y > @y_max

        q << [y, x, dy, dx] if @map[y][x] == '.' || @map[y][x] == '-' && dx != 0 || @map[y][x] == '|' && dy != 0
        q << [y, x, -1, 0]  if @map[y][x] == '/' && dx > 0 || @map[y][x] == '\\' && dx < 0 || @map[y][x] == '|' && dx != 0
        q << [y, x, 1, 0]   if @map[y][x] == '/' && dx < 0 || @map[y][x] == '\\' && dx > 0 || @map[y][x] == '|' && dx != 0
        q << [y, x, 0, -1]  if @map[y][x] == '/' && dy > 0 || @map[y][x] == '\\' && dy < 0 || @map[y][x] == '-' && dy != 0
        q << [y, x, 0, 1]   if @map[y][x] == '/' && dy < 0 || @map[y][x] == '\\' && dy > 0 || @map[y][x] == '-' && dy != 0
      end
      return seen.keys.map { |v| y, x, _ = v.split(',') ; "#{y},#{x}" }.uniq.length - 1
    end


    def part1!
      let_there_be_light(0, -1, 0, 1)
    end

    def part2!
      starts = []
      0.upto(@y_max) do |y|
        starts << [y, -1, 0, 1]
        starts << [y, @x_max + 1, 0, -1]
      end
      0.upto(@x_max) do |x|
        starts << [-1, x, 1, 0]
        starts << [@y_max + 1, x, -1, 0]
      end
      starts.map { |(y, x, dy, dx)| let_there_be_light(y, x, dy, dx) }.max
    end

  end
end

