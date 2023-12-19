
module Aoc2023
  class Day18 < Solution

    def parse_input
      dir_map = { 'R' => [0, 1], 'L' => [0, -1], 'U' => [-1, 0], 'D' => [1, 0] }
      hex_map = { '0' => [0, 1], '2' => [0, -1], '3' => [-1, 0], '1' => [1, 0] }
      @path = []
      @hard_path = []
      input.map do |line|
        dir, n, color = line.split
        @path << [dir_map[dir], n.to_i]
        color = color.gsub(/\(#|\)/, '')
        @hard_path << [hex_map[color[-1]], color[0..4].to_i(16)]
      end
    end

    def lagoon_size(path)
      x = y = 0
      x_min = y_max = y_min = 0
      path.each do |(dy, dx), n|
        x = x + dx * n
        y = y + dy * n
        y_max = y if y > y_max
        x_min = x if x < x_min
        y_min = y if y < y_min
      end

      edges = Array.new(y_max - y_min + 3) { Array.new }
      y = y_min.abs + 1
      x = x_min.abs + 1
      path.each do |(dy, dx), n, color|
        n.times do
          x += dx
          y += dy
          edges[y] << x
        end
      end

      sum = 0
      edges.each_with_index do |row, y|
        x = 0
        inside = false
        row = row.sort
        while x < row.length - 1
          if row[x] == row[x+1] - 1
            begin_is_above = edges[y - 1].include?(row[x])
            x_end = x
            x_end = x_end + 1 while row[x_end] == (row[x_end + 1] || 0) - 1
            end_is_above = edges[y - 1].include?(row[x_end])
            x = x_end
            inside = !inside if begin_is_above != end_is_above
            sum += row[x+1] - row[x] - 1 if inside
          else
            inside = !inside
            sum += row[x+1] - row[x] - 1 if inside
          end
          x = x + 1
        end
      end
      sum + edges.sum { |row| row.length }
    end

    def part1!
      lagoon_size(@path)
    end

    def part2!
      lagoon_size(@hard_path)
    end

  end
end

