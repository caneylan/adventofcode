module Aoc2021
  class Day16 < Solution

    @@hex_to_bin = {
      "0" => "0000",
      "1" => "0001",
      "2" => "0010",
      "3" => "0011",
      "4" => "0100",
      "5" => "0101",
      "6" => "0110",
      "7" => "0111",
      "8" => "1000",
      "9" => "1001",
      "A" => "1010",
      "B" => "1011",
      "C" => "1100",
      "D" => "1101",
      "E" => "1110",
      "F" => "1111",
    }

    def initialize(filename)
      super(filename)
      @stream = input.first.chars.map { |c| @@hex_to_bin[c] }.join('').chars
    end

    def parse_packet!
      packet = {}
      packet[:version] = @stream.shift(3).join('').to_i(2)
      packet[:version_sum] = packet[:version]
      packet[:type] = @stream.shift(3).join('').to_i(2)
      packet[:is_operator] = packet[:type] != 4
      packet[:length] = 6
      if packet[:is_operator]
        packet[:payload] = []
        packet[:payload_length_type] = @stream.shift(1).first.to_i
        if packet[:payload_length_type] == 0
          packet[:payload_length] = @stream.shift(15).join('').to_i(2)
          packet[:length] += 16 + packet[:payload_length]
          parsed_length = 0
          loop do
            packet[:payload] << parse_packet!
            packet[:version_sum] += packet[:payload].last[:version_sum]
            parsed_length += packet[:payload].last[:length]
            break if parsed_length >= packet[:payload_length]
          end
        else
          packet[:payload_count] = @stream.shift(11).join('').to_i(2)
          packet[:length] += 12
          packet[:payload_count].times do
            packet[:payload] << parse_packet!
            packet[:version_sum] += packet[:payload].last[:version_sum]
            packet[:length] += packet[:payload].last[:length]
          end
        end
      else
        packet[:value] = []
        loop do
          has_more_data = @stream.shift(1).first == '1'
          packet[:value] << @stream.shift(4)
          packet[:length] += 5
          break unless has_more_data
        end
        packet[:value] = packet[:value].flatten.join('').to_i(2)
      end

      return packet
    end

    def eval_packet!(packet)
      packet[:payload] and packet[:payload].each do |p|
        eval_packet!(p) unless p[:value]
      end
      case packet[:type]
      when 0 # sum
        packet[:value] = packet[:payload].inject(0) { |sum, p| sum = sum + p[:value] }
      when 1 # product
        packet[:value] = packet[:payload].inject(1) { |product, p| product = product * p[:value] }
      when 2 # min
        packet[:value] = packet[:payload].map { |p| p[:value] }.min
      when 3 # max
        packet[:value] = packet[:payload].map { |p| p[:value] }.max
      when 5 # 1 if p[0] > p[1]; otherwise 0
        packet[:value] = packet[:payload][0][:value] > packet[:payload][1][:value] ? 1 : 0
      when 6 # 1 if p[0] < p[1]; otherwise 0
        packet[:value] = packet[:payload][0][:value] < packet[:payload][1][:value] ? 1 : 0
      when 7 # 1 if p[1] == p[0]; otherwise 0
        packet[:value] = packet[:payload][0][:value] == packet[:payload][1][:value] ? 1 : 0
      end
    end

    def part1!
      packet = parse_packet!
      return packet[:version_sum]
    end

    def part2!
      packet = parse_packet!
      eval_packet!(packet)
      return packet[:value]
    end

  end
end
