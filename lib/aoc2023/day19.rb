
module Aoc2023
  class Day19 < Solution

    require_relative '../cuboid.rb'

    def parse_input
      @sort_rules = {}
      input[0..input.index('') - 1].map do |line|
        key = line.sub(/{.*/, '')
        rules = line.gsub(/.*{|}/, '').split(',')
        @sort_rules[key] = {
          :rules => rules[0..-2].map do |rule|
                      rule =~ /^([a-z]+)([<>])(-?\d+):([A-Za-z]+)$/
                      k, op, v, d = $1, $2, $3, $4
                      [ k, op.to_sym, v.to_i, d ]
                    end,
          :default => rules[-1],
        }
      end
      @parts = input[input.index('') + 1..-1].map do |line|
                 h = {}
                 line.gsub(/{|}/, '').split(',').each do |attr|
                   h[attr.sub(/=.*/, '')] = attr.sub(/.*=/, '').to_i
                 end
                 h
               end
    end

    # walks the raw workflows and converts them to lists of full specs for allowed objects
    def allowed_flows
      op_flip = { :> => :<=, :>= => :<, :< => :>=, :<= => :> }
      a_flows = []
      flows = []

      # init in
      default_rule = { :rules => [], :dest => @sort_rules['in'][:default] }
      flip_log = []
      @sort_rules['in'][:rules].each do |(k, op, v, d)|
        flows << { :rules => [[k, op, v]], :dest => d }
        flip_log << [k, op_flip[op], v]
      end
      default_rule[:rules] = flip_log
      flows << default_rule

      # walk until all are allowed or rejected
      until flows.empty?
        flow = flows.shift
        default_rule = { :rules => flow[:rules], :dest => @sort_rules[flow[:dest]][:default] }
        flip_log = []
        @sort_rules[flow[:dest]][:rules].each do |(k, op, v, d)|
          if d == 'A'
            a_flows << { :rules => flow[:rules] + flip_log + [[k, op, v]], :dest => d }
          elsif d != 'R'
            flows << { :rules => flow[:rules] + flip_log + [[k, op, v]], :dest => d }
          end
          flip_log << [k, op_flip[op], v]
        end
        default_rule[:rules] += flip_log
        if default_rule[:dest] == 'A'
          a_flows << default_rule
        elsif default_rule[:dest] != 'R'
          flows << default_rule
        end
      end
      return a_flows
    end

    # converts flows (lists of filters) into ranges for each key
    def possible_ranges(flows)
      ranges = []
      flows.each do |flow|
        range = {
          'x' => (1..4000),
          'm' => (1..4000),
          'a' => (1..4000),
          's' => (1..4000),
        }
        flow[:rules].each do |(k, op, n)|
          case op
          when :<
            range[k] = (range[k].begin .. (n - 1))
          when :<=
            range[k] = (range[k].begin .. n)
          when :>
            range[k] = ((n + 1) .. range[k].end)
          when :>=
            range[k] = (n .. range[k].end)
          end
        end
        ranges << range
      end
      return ranges
    end

    def part1!
      a_flows = allowed_flows
      ranges = possible_ranges(a_flows)
      allowed = []
      @parts.each do |part|
        ranges.each do |range|
          allowed << part and break if range.reject { |k, r| r.include?(part[k]) }.empty?
        end
      end
      return allowed.sum { |p| p.values.sum }
    end

    def part2!
      a_flows = allowed_flows
      cubes = possible_ranges(a_flows).map { |r| Cuboid.new([r['x'], r['m'], r['a'], r['s']]) }
      unique_cubes = Cuboid.unique(cubes)
      unique_cubes.sum { |c| c.size }
    end

  end
end

