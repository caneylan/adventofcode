
module Aoc2023
  class Day13 < Solution

    def parse_input
      @images = input.slice_when { |a, b| a.empty? }.map { |img| img.reject { |row| row.empty? }.map(&:chars) }
    end

    def has_reflection?(image, y)
      0.upto(image.length - y - 1) do |dy|
        return true if y - dy - 1 < 0
        return false if image[y + dy].join != image[y - dy - 1].join
      end
      true
    end

    def find_reflection(image, but_not_this_one = nil)
      1.upto(image.length - 1) do |y|
        return y if has_reflection?(image, y) && y != but_not_this_one
      end
      nil
    end

    def part1!
      @images.map do |image|
        ry = find_reflection(image)
        if ry
          100 * ry
        else
          find_reflection(image.transpose.map(&:reverse))
        end
      end.sum
    end

    def part2!
      @images.map do |image|
        orig_ry_row = find_reflection(image)
        orig_ry_col = find_reflection(image.transpose.map(&:reverse))
        ry = nil
        0.upto(image.length - 1) do |y|
          0.upto(image[0].length - 1) do |x|
            image[y][x] = (image[y][x] == '.' ? '#' : '.')
            ry = find_reflection(image, orig_ry_row)
            if ry
              ry = 100 * ry
              break
            else
              ry = find_reflection(image.transpose.map(&:reverse), orig_ry_col)
              break if ry
              image[y][x] = (image[y][x] == '.' ? '#' : '.')
            end
          end
          break if ry
        end
        ry
      end.sum
    end

  end
end

