module Aoc2020
  class Day20 < Solution

    def initialize(filename)
      super(filename)
      tiles = []
      tile_id = nil
      tile_input = []
      input.each do |line|
        case line
        when /^Tile (\d+):$/
          tile_id = $1.to_i
        when /^(\.|#)/
          tile_input << line.strip
        else
          tiles << ImageTile.new(tile_id, tile_input)
          tile_id = nil
          tile_input = []
        end
      end
      @composite_image = CompositeImage.new(tiles)
    end

    def part1!
      # puts @composite_image.to_s
      return @composite_image.corner_product
    end

    def part2!
      full_tile = @composite_image.shrinky_dink
      # puts full_tile.to_s

      most = 0
      full_tile.each_orientation do |img|
        count = 0
        2.upto(img.size - 1) do |row_index|
          0.upto(img.size - 20) do |col_index|
            if img.image[row_index][col_index, 20].join =~ /^.#..#..#..#..#..#.../ &&
               img.image[row_index - 1][col_index, 20].join =~ /^#....##....##....###/ &&
               img.image[row_index - 2][col_index, 20].join =~ /^..................#./
              count += 1
            end
          end
        end
        most = count if count > most
      end

      return full_tile.image.image.map { |row| row.count('#') }.reduce(&:+) - 15 * most
    end

  end


  class CompositeImage

    def initialize(tiles)
      @size = Math.sqrt(tiles.length).to_i
      @tile_size = tiles.first.size
      @composite = Array.new(@size) { Array.new(@size) }

      @composite[0][0] = tiles[0]
      tile_queue = tiles[1..-1]

      until tile_queue.empty?
        each_tile do |row_index, col_index|

          # look up
          if row_index == 0 || @composite[row_index - 1][col_index].nil?
            top_border = @composite[row_index][col_index].top_border
            matching_tile = tile_queue.find { |tile| tile.find { |img| img.bottom_border == top_border } }
            if matching_tile
              tile_queue.delete(matching_tile)
              shift_everything_down! && row_index += 1 if row_index == 0
              @composite[row_index - 1][col_index] = matching_tile
            end
          end

          # look down
          if row_index < @size - 1 && @composite[row_index + 1][col_index].nil?
            bottom_border = @composite[row_index][col_index].bottom_border
            matching_tile = tile_queue.find { |tile| tile.find { |img| img.top_border == bottom_border } }
            if matching_tile
              tile_queue.delete(matching_tile)
              @composite[row_index + 1][col_index] = matching_tile
            end
          end

          # look left
          if col_index == 0 || @composite[row_index][col_index - 1].nil?
            left_border = @composite[row_index][col_index].left_border
            matching_tile = tile_queue.find { |tile| tile.find { |img| img.right_border == left_border } }
            if matching_tile
              tile_queue.delete(matching_tile)
              shift_everything_right! && col_index += 1 if col_index == 0
              @composite[row_index][col_index - 1] = matching_tile
            end
          end

          # look right
          if col_index < @size - 1 && @composite[row_index][col_index + 1].nil?
            right_border = @composite[row_index][col_index].right_border
            matching_tile = tile_queue.find { |tile| tile.find { |img| img.left_border == right_border } }
            if matching_tile
              tile_queue.delete(matching_tile)
              @composite[row_index][col_index + 1] = matching_tile
            end
          end

        end
      end
    end

    def each_tile(&block)
      0.upto(@size - 1) do |row_index|
        0.upto(@size - 1) do |col_index|
          yield(row_index, col_index) if @composite[row_index][col_index]
        end
      end
    end

    def shift_everything_down!
      (@size - 1).downto(1) do |row_index|
        0.upto(@size - 1) do |col_index|
          @composite[row_index][col_index] = @composite[row_index - 1][col_index]
        end
      end
      0.upto(@size - 1) do |col_index|
        @composite[0][col_index] = nil
      end
    end

    def shift_everything_right!
      0.upto(@size - 1) do |row_index|
        (@size - 1).downto(1) do |col_index|
          @composite[row_index][col_index] = @composite[row_index][col_index - 1]
        end
        @composite[row_index][0] = nil
      end
    end

    def corner_product
      @composite.first.first.id * @composite.first.last.id * @composite.last.first.id * @composite.last.last.id
    end

    def shrinky_dink
      input = []
      @composite.each do |tile_row|
        1.upto(@tile_size - 2) do |tile_row_index|
          s = ""
          tile_row.each do |tile|
            s += (tile ? tile.to_s(tile_row_index)[1..-2] : " " * @tile_size)
          end
          input << s
        end
      end
      ImageTile.new('shrinky dink', input)
    end

    def to_s
      s = "COMPOSITE IMAGE:\n\n"
      @composite.each do |tile_row|
        tile_row.each do |tile|
          s += sprintf("%-#{@tile_size}s", tile ? "Tile #{tile.id}" : "") + " "
        end
        s += "\n"
        0.upto(@tile_size - 1) do |tile_row_index|
          tile_row.each do |tile|
            s += (tile ? tile.to_s(tile_row_index) : " " * @tile_size) + " "
          end
          s += "\n"
        end
        s += "\n"
      end
      s
    end

  end


  class ImageTile

    attr_reader :id

    def initialize(id, input)
      @id = id
      @curr_i = 0
      @orientations = []
      @orientations << Image.new(input)                   # image
      @orientations << @orientations[-1].horizontal_flip  # image.horizontal_flip
      @orientations << @orientations[-2].vertical_flip    # image.vertical_flip
      @orientations << @orientations[-1].horizontal_flip  # image.vertical_flip.horizontal_flip
      @orientations << @orientations[-4].rotate           # image.rotate
      @orientations << @orientations[-1].horizontal_flip  # image.rotate.horizontal_flip
      @orientations << @orientations[-2].vertical_flip    # image.rotate.vertical_flip
      @orientations << @orientations[-1].horizontal_flip  # image.rotate.vertical_flip.horizontal_flip
    end

    def image
      @orientations[@curr_i]
    end
    def size
      image.size
    end
    def eql?(other)
      id == other.id
    end

    def each_orientation(&block)
      @orientations.each do |img|
        yield(img)
      end
    end

    def find(&block)
      @orientations.each_with_index do |img, i|
        if yield(img)
          @curr_i = i
          return self
        end
      end
      return nil
    end

    def top_border
      image.top_border
    end
    def bottom_border
      image.bottom_border
    end
    def left_border
      image.left_border
    end
    def right_border
      image.right_border
    end

    def to_s(i = nil)
      return image.to_s(i) if i
      "Tile #{id}:\n" + image.to_s
    end

  end

  class Image

    attr_reader :image

    def initialize(input)
      raise TypeError, "expected input to be an Array, but got #{input.class.name}" unless input.is_a?(Array)
      @image = input.map do |row|
                 case row
                 when String
                   row.chars
                 when Array
                   row.clone
                 else
                   raise TypeError, "expected input to be an Array of Array or String elements, but got #{row.class.name} element"
                 end
               end
    end

    def rotate
      @rotate ||= Image.new(@image.transpose.map(&:reverse))
    end
    def vertical_flip
      @vertical_flip ||= Image.new(@image.reverse)
    end
    def horizontal_flip
      @horizontal_flip ||= Image.new(@image.map(&:reverse))
    end

    def top_border
      @top_border ||= @image.first.join('')
    end
    def bottom_border
      @bottom_border ||= @image.last.join('')
    end
    def left_border
      @left_border ||= @image.map(&:first).join('')
    end
    def right_border
      @right_border ||= @image.map(&:last).join('')
    end

    def size
      @size ||= @image.length
    end

    def to_s(i = nil)
      return @image[i].join if i
      @to_s ||= @image.map(&:join).join("\n")
    end

  end

end



#
# Image Transformations
#
#       r    h    v   v+h
#
#      abc  cba  gfe  efg
# 0xr  h d  d h  h d  d h
#      gfe  efg  abc  cba
#  
#      gha  ahg  edc  cde
# 1xr  f b  b f  f b  b f
#      edc  cde  gha  ahg
#  
#      efg  gfe  cba  abc
# 2xr  d h  h d  d h  h d
#      cba  abc  efg  gfe
#  
#      cde  edc  ahg  gha
# 3xr  b f  f b  b f  f b
#      ahg  gha  cde  edc
#
# all:
#
#  abcdefgh image
#  cbahgfed image.horizontal_flip
#  gfedcbah image.vertical_flip
#  efghabcd image.vertical_flip.horizontal_flip
#  ghabcdef image.rotate
#  ahgfedcb image.rotate.horizontal_flip
#  edcbahgf image.rotate.vertical_flip
#  cdefghab image.rotate.vertical_flip.horizontal_flip
#  efghabcd image.rotate.rotate
#  gfedcbah image.rotate.rotate.horizontal_flip
#  cbahgfed image.rotate.rotate.vertical_flip
#  abcdefgh image.rotate.rotate.vertical_flip.horizontal_flip
#  cdefghab image.rotate.rotate.rotate
#  edcbahgf image.rotate.rotate.rotate.horizontal_flip
#  ahgfedcb image.rotate.rotate.rotate.vertical_flip
#  ghabcdef image.rotate.rotate.rotate.vertical_flip.horizontal_flip
#
# sorted:
#
#   abcdefgh image
#   abcdefgh image.rotate.rotate.vertical_flip.horizontal_flip
#   ahgfedcb image.rotate.horizontal_flip
#   ahgfedcb image.rotate.rotate.rotate.vertical_flip
#   cbahgfed image.horizontal_flip
#   cbahgfed image.rotate.rotate.vertical_flip
#   cdefghab image.rotate.rotate.rotate
#   cdefghab image.rotate.vertical_flip.horizontal_flip
#   edcbahgf image.rotate.rotate.rotate.horizontal_flip
#   edcbahgf image.rotate.vertical_flip
#   efghabcd image.rotate.rotate
#   efghabcd image.vertical_flip.horizontal_flip
#   gfedcbah image.rotate.rotate.horizontal_flip
#   gfedcbah image.vertical_flip
#   ghabcdef image.rotate
#   ghabcdef image.rotate.rotate.rotate.vertical_flip.horizontal_flip
#
# unique:
#
#   image
#   image.horizontal_flip
#   image.vertical_flip
#   image.vertical_flip.horizontal_flip
#   image.rotate
#   image.rotate.horizontal_flip
#   image.rotate.vertical_flip
#   image.rotate.vertical_flip.horizontal_flip
#

