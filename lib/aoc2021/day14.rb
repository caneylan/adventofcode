module Aoc2021
  class Day14 < Solution

    def initialize(filename)
      super(filename)
      @template = input.first.chars.map(&:to_sym)
      @poly_map = Hash.new { |h, k| h[k] = Hash.new }
      @cache = Hash.new { |h, depth| h[depth] = Hash.new { |h, a| h[a] = Hash.new } }
      input.each do |line|
        p, c = line.split(' -> ')
        next unless p and c
        @poly_map[p[0].to_sym][p[1].to_sym] = c.to_sym
      end
    end

    def do_tree(a, b, depth)
      if depth == 0
        return { a => 1 }
      elsif ! @cache[depth][a][b]
        c = @poly_map[a][b]
        ac = do_tree(a, c, depth - 1)
        cb = do_tree(c, b, depth - 1)
        @cache[depth][a][b] = ac.merge(cb) { |k, sum_ac, sum_cb| sum_ac + sum_cb }
      end
      return @cache[depth][a][b]
    end

    def solve!(n_steps)
      counts = {}
      0.upto(@template.length - 2) do |i|
        counts.merge!(
                do_tree(@template[i], @template[i+1], n_steps)
              ) do |k, sum_ac, sum_cb|
                sum_ac + sum_cb
              end
      end
      counts[@template.last] += 1
      return counts.values.max - counts.values.min
    end

  end
end
