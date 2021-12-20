module Aoc2021
  class Day20 < Solution

    class Image
      attr_reader :min_x, :min_y, :max_x, :max_y
      def initialize(i)
        @image = Hash.new { |h, k| h[k] = Hash.new(0) }
        @min_x = @min_y = @max_x = @max_y = nil
        @default = i
      end
      def add(y, x, v)
        @image[y][x] = v
        @min_x = x if @min_x.nil? or x < @min_x
        @max_x = x if @max_x.nil? or x > @max_x
        @min_y = y if @min_y.nil? or y < @min_y
        @max_y = y if @max_y.nil? or y > @max_y
      end
      def get(y, x)
        if y <= @max_y && y >= @min_y && x <= @max_x && x >= @min_x
          @image[y][x]
        else
          @default
        end
      end
      def luminosity
        return @image.map { |y, row| row.values.count(1) }.sum
      end
    end

    def initialize(filename)
      super(filename)
      @key = input.first.chars.map { |c| c == '#' ? 1 : 0 }
      @image = Image.new(0)
      input.drop(2).each_with_index do |line, y|
        line.chars.each_with_index do |c, x|
          if c == '#'
            @image.add(y, x, 1)
          end
        end
      end
    end

    def enhance
      default = @image.get(@image.min_y - 3, @image.min_x - 3).to_s + \
                  @image.get(@image.min_y - 3, @image.min_x - 2).to_s + \
                  @image.get(@image.min_y - 3, @image.min_x - 1).to_s + \
                  @image.get(@image.min_y - 2, @image.min_x - 3).to_s + \
                  @image.get(@image.min_y - 2, @image.min_x - 2).to_s + \
                  @image.get(@image.min_y - 2, @image.min_x - 1).to_s + \
                  @image.get(@image.min_y - 1, @image.min_x - 3).to_s + \
                  @image.get(@image.min_y - 1, @image.min_x - 2).to_s + \
                  @image.get(@image.min_y - 1, @image.min_x - 2).to_s

      new_image = Image.new( @key[default.to_i(2)] )

      (@image.min_y - 1).upto(@image.max_y + 1) do |y|
        (@image.min_x - 1).upto(@image.max_x + 1) do |x|
          str = "" + \
            @image.get(y-1, x-1).to_s + \
            @image.get(y-1, x  ).to_s + \
            @image.get(y-1, x+1).to_s + \
            @image.get(  y, x-1).to_s + \
            @image.get(  y, x  ).to_s + \
            @image.get(  y, x+1).to_s + \
            @image.get(y+1, x-1).to_s + \
            @image.get(y+1, x  ).to_s + \
            @image.get(y+1, x+1).to_s
          new_image.add(y, x, @key[str.to_i(2)])
        end
      end
      return new_image
    end

    def part1!
      2.times do
        @image = enhance
      end
      return @image.luminosity
    end

    def part2!
      50.times do
        @image = enhance
      end
      return @image.luminosity
    end

  end
end
