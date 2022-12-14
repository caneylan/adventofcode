
module Aoc2022
  class Day14 < Solution

    def parse_input
      @field = Hash.new { |h, k| h[k] = Hash.new(nil) }
      input.each do |line|
        tokens = line.split(' -> ')
        0.upto(tokens.length - 2) do |i|
          a_x, a_y, b_x, b_y = tokens[i].split(',').map(&:to_i) + tokens[i+1].split(',').map(&:to_i)
          if a_x == b_x
            [a_y, b_y].min.upto([a_y, b_y].max) { |y| @field[y][a_x] = '#' }
          else
            [a_x, b_x].min.upto([a_x, b_x].max) { |x| @field[a_y][x] = '#' }
          end
        end
      end
      @field_max_y = @field.keys.max
    end

    def add_floor!
      floor = @field_max_y + 2
      new_field = Hash.new { |h, k| h[k] = (k >= floor ? Hash.new('#') : Hash.new(nil)) }
      @field.each { |y, row| row.each { |x, v| new_field[y][x] = v } }
      @field = new_field
      @field_max_y = floor
    end

    def puts_field
      field_max_x = @field.values.select(&:any?).map { |h| h.keys.max }.max
      field_min_x = @field.values.select(&:any?).map { |h| h.keys.min }.min
      0.upto(@field_max_y) do |y|
        row = "% 4d:" % y.to_i
        field_min_x.upto(field_max_x) do |x|
          row += @field[y][x] ? @field[y][x].to_s : ' '
        end
        puts row
      end
    end

    def drop_sand(x, y)
      y +=1 until @field[y+1][x] || y > @field_max_y
      return nil if y > @field_max_y
      return y
    end

    def add_sand!(x, y)
      drop_y = drop_sand(x, y) or return false

      left_x, left_y = [x - 1, drop_y + 1]
      return add_sand!(left_x, left_y) unless @field[left_y][left_x]

      right_x, right_y = [x + 1, drop_y + 1]
      return add_sand!(right_x, right_y) unless @field[right_y][right_x]

      @field[drop_y][x] = 'o'
      @field_max_y = drop_y if drop_y > @field_max_y
      return true
    end

    def part1!
      count = 0
      count += 1 while add_sand!(500, 0)
      puts_field if is_example?
      count
    end

    def part2!
      add_floor!
      count = 0
      while add_sand!(500, 0)
        count += 1
        break if @field[0][500]
      end
      puts_field if is_example?
      count
    end

  end
end

