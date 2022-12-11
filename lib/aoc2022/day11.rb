
module Aoc2022
  class Day11 < Solution

    def parse_input
      @monkeys = {}
      current_monkey = nil
      input.each do |line|
        case line
        when /^Monkey (.*):$/
          @monkeys[$1] = { :count => 0 }
          current_monkey = @monkeys[$1]
        when /^Starting items: (.*)$/
          current_monkey[:items] = $1.split(', ').map(&:to_i)
        when /^Operation: new = old (.) (.*)$/
          current_monkey[:op] = $1.to_sym
          current_monkey[:operand] = $2.to_i unless $2 == 'old'
        when /^Test: divisible by (.*)$/
          current_monkey[:div_by] = $1.to_i
        when /^If true: throw to monkey (.*)$/
          current_monkey[:div_by_true_to] = $1
        when /^If false: throw to monkey (.*)$/
          current_monkey[:div_by_false_to] = $1
        end
      end
      @global_mod = @monkeys.map { |i, m| m[:div_by] }.reduce(&:*)
    end

    def monkey_round!(managed_worry = true)
      @monkeys.each do |monkey_id, monkey|
        until monkey[:items].empty?
          item = monkey[:items].pop
          monkey[:count] += 1
          item = item.send(monkey[:op], monkey[:operand] || item)
          item = item / 3 if managed_worry
          item = item % @global_mod
          if item % monkey[:div_by] == 0
            @monkeys[monkey[:div_by_true_to]][:items] << item
          else
            @monkeys[monkey[:div_by_false_to]][:items] << item
          end
        end
      end
    end

    def part1!
      20.times { monkey_round! }
      counts = @monkeys.map { |i, m| m[:count] }.sort
      counts[-2] * counts[-1]
    end

    def part2!
      10000.times { |i| monkey_round!(false) }
      counts = @monkeys.map { |i, m| m[:count] }.sort
      counts[-2] * counts[-1]
    end

  end
end

