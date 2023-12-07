
module Aoc2023
  class Day07 < Solution

    def parse_input
      @card_vals = Hash[%w{2 3 4 5 6 7 8 9 T J Q K A}.each_with_index.map { |c, i| [c, i] }]
      @non_jokers = @card_vals.keys.reject { |c| c == 'J' }
      @hands = input.map(&:split).map do |(cards, wager)|
                 { :cards => cards.chars, :wager => wager.to_i }
               end
    end

    def value_cards(cards)
      lookup = Hash.new(0)
      cards.each { |card| lookup[card] += 1 }
      if lookup.length == 1
        return 6 # five_of_a_kind
      elsif lookup.values.include?(4)
        return 5 # four_of_a_kind
      elsif lookup.length == 2
        return 4 # full_house
      elsif lookup.values.include?(3)
        return 3 # three_of_a_kind
      elsif lookup.length == 3
        return 2 # two_pair
      elsif lookup.length == 4
        return 1 # one_pair
      elsif lookup.length == 5
        return 0 # high_card
      else
        raise "panic"
      end
    end

    def value_cards_with_jokers(cards)
      joker_count = cards.count('J')
      return value_cards(cards) if joker_count == 0 # this actually isn't necessary

      base_cards = cards.select { |c| c != 'J' }
      @non_jokers.map do |card|
        value_cards(base_cards + Array.new(joker_count, card))
      end.max
    end

    def sort_hands(hands)
      hands.sort do |a, b|
        if a[:value] == b[:value]
          0.upto(4) do |i|
            break @card_vals[a[:cards][i]] <=> @card_vals[b[:cards][i]] if a[:cards][i] != b[:cards][i]
          end
        else
          a[:value] <=> b[:value]
        end
      end
    end

    def part1!
      @hands.each do |hand|
        hand[:value] = value_cards(hand[:cards])
      end
      sort_hands(@hands).each_with_index.map do |hand, i|
        (i + 1) * hand[:wager]
      end.sum
    end

    def part2!
      @hands.each do |hand|
        hand[:value] = value_cards_with_jokers(hand[:cards])
      end
      @card_vals['J'] = -1
      sort_hands(@hands).each_with_index.map do |hand, i|
        (i + 1) * hand[:wager]
      end.sum
    end

  end
end

