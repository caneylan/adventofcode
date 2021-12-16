module Aoc2021
  class Day16 < Solution

    def initialize(filename)
      super(filename)
      @stream = input.first.chars.map { |c| "%04d" % c.to_i(16).to_s(2) }.join('')
    end

    def parse_packet!
      packet = {}
      packet[:version] = @stream.slice!(0..2).to_i(2)
      packet[:version_sum] = packet[:version]
      packet[:type] = @stream.slice!(0..2).to_i(2)
      packet[:is_operator] = packet[:type] != 4
      packet[:length] = 6
      if packet[:is_operator]
        packet[:payload] = []
        packet[:payload_length_type] = @stream.slice!(0).to_i
        if packet[:payload_length_type] == 0
          packet[:payload_length] = @stream.slice!(0..14).to_i(2)
          packet[:length] += 16 + packet[:payload_length]
          parsed_length = 0
          loop do
            packet[:payload] << parse_packet!
            packet[:version_sum] += packet[:payload].last[:version_sum]
            parsed_length += packet[:payload].last[:length]
            break if parsed_length >= packet[:payload_length]
          end
        else
          packet[:payload_count] = @stream.slice!(0..10).to_i(2)
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
          has_more_data = @stream.slice!(0) == '1'
          packet[:value] << @stream.slice!(0..3)
          packet[:length] += 5
          break unless has_more_data
        end
        packet[:value] = packet[:value].join('').to_i(2)
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
