
module Aoc2023
  class Day09 < Solution

    def parse_input
      @input = @input.map(&:split).map { |nums| nums.map(&:to_i) }
    end

    def next_seq(seq)
      0.upto(seq.length - 2).map do |i|
        seq[i + 1] - seq[i]
      end
    end

    def expand_seq_until_zeros(seq)
      seqs = [seq]
      until seqs.last.count(0) == seqs.last.length
        seqs << next_seq(seqs.last)
      end
      seqs
    end

    def part1!
      input.map { |seq| expand_seq_until_zeros(seq).map(&:last).sum }.sum
    end

    def part2!
      input.map do |seq|
        seqs = expand_seq_until_zeros(seq)
        n = 0
        (seqs.length - 2).downto(0).map do |i|
          n = seqs[i].first - n
        end
        n
      end.sum
    end

  end
end

