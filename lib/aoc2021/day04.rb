
module Aoc2021
  class Day04 < Solution

    def initialize(filename)
      super(filename)
      @draw_numbers = input.first.split(',').map(&:to_i)
      @boards = []
      input.drop(1).each do |line|
        if line.empty?
          @boards << []
        else
          @boards.last << line.split.map { |n| { :value => n.to_i, :drawn => false } }
        end
      end
      @board_size = @boards.first.length
    end

    def get_winners
      winners = []
      @boards.each do |board|
        next unless board.each do |row|
          winners << board and break if row.count { |x| x[:drawn] } == @board_size
        end
        0.upto(@board_size - 1) do |col_index|
          winners << board and break if board.map { |row| row[col_index] }.count { |x| x[:drawn] } == @board_size
        end
      end
      return winners
    end

    def draw_number!(draw)
      @boards.each do |board|
        board.each do |row|
          row.each do |x|
            x[:drawn] = true if x[:value] == draw
          end
        end
      end
    end

    def score(board, draw)
      unmarked_sum = board.map { |row| row.map { |v| v[:drawn] ? 0 : v[:value] } }.flatten.sum
      return unmarked_sum * draw
    end

    def part1!
      @draw_numbers.each do |num|
        draw_number!(num)
        winners = get_winners
        if winners.any?
          return score(winners.first, num)
        end
      end
    end

    def part2!
      last_winner = nil
      last_num = nil
      @draw_numbers.each do |num|
        draw_number!(num)
        get_winners.each do |winner|
          last_winner = winner
          last_num = num
          @boards.delete(winner)
        end
      end
      return score(last_winner, last_num)
    end

  end
end


