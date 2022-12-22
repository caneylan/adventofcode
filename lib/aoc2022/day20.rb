
module Aoc2022
  class Day20 < Solution

    class MultitonInteger
      attr_reader :id
      attr_accessor :value, :next, :prev
      def initialize(id, value)
        @id = id
        @value = value
      end
    end

    def parse_input
      @num_ids = []
      @num_lookup = {}
      prev = nil
      input.each_with_index do |line, index|
        n = MultitonInteger.new(index, line.to_i)
        n.prev = prev
        prev.next = n if prev
        prev = n
        @num_lookup[n.id] = n
        @num_ids << n.id
        @zero = n if n.value == 0
      end
      prev.next = @num_lookup[@num_ids[0]]
      @num_lookup[@num_ids[0]].prev = prev
    end

    def move!(n)
      shifts = n.value.abs
      loop do
        shifts = shifts % @num_ids.length + shifts / @num_ids.length
        break if shifts < @num_ids.length
      end
      return if shifts == 0

      p = n.next
      n.prev.next = n.next
      n.next.prev = n.prev

      if n.value > 0
        shifts.times { p = p.next }
      else
        shifts.times { p = p.prev }
      end

      p.prev.next = n
      n.prev = p.prev
      n.next = p
      p.prev = n
    end

    def do_mix!
      @num_ids.each do |id|
        move!(@num_lookup[id])
      end
    end

    def part1!
      do_mix!
      a = b = c = @zero
      1000.times { a = a.next }
      2000.times { b = b.next }
      3000.times { c = c.next }
      a.value + b.value + c.value
    end

    def part2!
      @num_ids.each { |id| @num_lookup[id].value = @num_lookup[id].value * 811589153 }
      10.times { |i| do_mix! }
      a = b = c = @zero
      1000.times { a = a.next }
      2000.times { b = b.next }
      3000.times { c = c.next }
      a.value + b.value + c.value
    end

  end
end

