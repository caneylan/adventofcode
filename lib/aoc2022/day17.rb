
module Aoc2022
  class Day17 < Solution

    def parse_input
      @jets = input.first.chars.map { |c| c == '>' ? :right : :left }
    end

    class Rock
      attr_accessor :shape, :width
      def height
        @shape.size
      end
    end

    class RockHline < Rock
      def initialize
        @shape = [15]
        @width = 4
      end
    end

    class RockPlus < Rock
      def initialize
        @shape = [2, 7, 2]
        @width = 3
      end
    end
    class RockL < Rock
      def initialize
        @shape = [7, 1, 1]
        @width = 3
      end
    end
    class RockVline < Rock
      def initialize
        @shape = [1, 1, 1, 1]
        @width = 1
      end
    end
    class RockBox < Rock
      def initialize
        @shape = [3, 3]
        @width = 2
      end
    end

    class Chamber
      def initialize(jets)
        @jets = jets
        @rows = Array.new(10, 0)
        @rocks = [ RockHline.new, RockPlus.new, RockL.new, RockVline.new, RockBox.new ]
        @current_rock_index = -1
        @current_jet_index = - 1
        @width = 7
        @bitwidth = ('1' * @width).to_i(2)
        @floor = 0
      end
      def next_rock
        @current_rock_index = (@current_rock_index + 1) % @rocks.length
        @current_rock = @rocks[@current_rock_index]
        y = top_empty_row + 3
        if y + @current_rock.height >= @rows.length
          @current_rock.height.times { @rows << 0 }
        end
        [@current_rock, y]
      end
      def next_jet
        @current_jet_index = (@current_jet_index + 1) % @jets.length
        @current_jet = @jets[@current_jet_index]
        @current_jet
      end
      def top_empty_row
        @rows.find_index(0)
      end
      def total_height
        @floor + top_empty_row
      end
      def insert_rock!(x, y, rock)
        raise "cant insert #{rock.class} to (#{x},#{y}): out of bounds" if x + 1 - rock.width < 0
        raise "cant insert #{rock.class} to (#{x},#{y}): out of bounds" if x > @width - 1
        0.upto(rock.height - 1) do |dy|
          row_y = y + dy
          bitrock = (rock.shape[dy] << (x + 1 - rock.width))
          raise "cant insert #{rock.class} to (#{x},#{y}): area occupied\n#{to_s}" if @rows[row_y] & bitrock != 0
          @rows[row_y] = @rows[row_y] | bitrock
          if @rows[row_y] == @bitwidth
            @floor += row_y + 1
            @rows = @rows[(row_y + 1)..-1]
            y = y - row_y - 1
          end
        end
      end
      def bounds_check(direction, x, y, rock)
        case direction
        when :right
          return 0 if x + 1 - rock.width <= 0
          0.upto(rock.height - 1) do |dy|
            bitrock = (rock.shape[dy] << (x - rock.width))
            return 0 if @rows[y + dy] & bitrock != 0
          end
          return -1
        when :left
          return 0 if x >= @width - 1
          0.upto(rock.height - 1) do |dy|
            bitrock = (rock.shape[dy] << (x + 2 - rock.width))
            return 0 if @rows[y + dy] & bitrock != 0
          end
          return 1
        when :down
          return 0 if y <= 0
          0.upto(rock.height - 1) do |dy|
            bitrock = (rock.shape[dy] << (x + 1 - rock.width))
            return 0 if @rows[y - 1 + dy] & bitrock != 0
          end
          return -1
        else
          raise "bounds_check: bad direction #{direction}"
        end
      end
      def add_rock!
        rock, y = next_rock
        x = 4

        loop do
          jet = next_jet
          dx = bounds_check(jet, x, y, rock)
          x += dx
          dy = bounds_check(:down, x, y, rock)
          y += dy
          break if dy == 0
        end
        insert_rock!(x, y, rock)
        return false
      end
      def to_s
        s = ""
        (@rows.size - 1).downto(0) do |i|
          content = @rows[i].to_s(2).chars.map { |c| c == '1' ? '#' : ' ' }.join
          s += "|%7s|#{i}\n" % content
        end
        s += "+-------+\n"
        s
      end
    end

    def part1!
      chamber = Chamber.new(@jets)
      2022.times do
        chamber.add_rock!
      end
      return chamber.total_height
    end

    def part2!
      return nil
    end

  end
end

