module Aoc2022
  class Day19 < Solution

    def parse_input
      @blueprints = Hash[input.map do |line| 
            n = line.scan(/\d+/).map(&:to_i) 
            [n[0], { :id => n[0],
                     :bot_costs => {
                       :orebot => { :ore => n[1] },
                       :claybot => { :ore => n[2] }, 
                       :obsbot => { :ore => n[3], :clay => n[4] },
                       :geobot => { :ore => n[5], :obs => n[6] }
                     }
                   }]
          end
        ]
      @blueprints.each do |id, bp|
        bp[:max_bots] = {
          :orebot => bp[:bot_costs].map { |b, c| c[:ore] }.max,
          :claybot => bp[:bot_costs][:obsbot][:clay],
          :obsbot => bp[:bot_costs][:geobot][:obs]
        }
      end
      @resource_from_bot = { :orebot => :ore, :claybot => :clay, :obsbot => :obs, :geobot => :geo }
      @bot_from_resource = { :ore => :orebot, :clay => :claybot, :obs => :obsbot, :geo => :geobot }
      @max_geodes = Hash[ @blueprints.keys.map { |id| [id, 0] } ]
    end

    # this could be implemented
    def factory_options(blueprint, bots, resources, time_left)
      options = []
      options << { :bot => :geobot, 
                   :time_needed => [ ((blueprint[:bot_costs][:geobot][:ore].to_f - resources[:ore]) / bots[:orebot]).ceil,
                                     ((blueprint[:bot_costs][:geobot][:obs].to_f - resources[:obs]) / bots[:obsbot]).ceil,
                                     0
                                   ].max
                 } if bots[:obsbot] > 0
      options << { :bot => :obsbot,
                   :time_needed => [ ((blueprint[:bot_costs][:obsbot][:ore].to_f - resources[:ore]) / bots[:orebot]).ceil,
                                     ((blueprint[:bot_costs][:obsbot][:clay].to_f - resources[:clay]) / bots[:claybot]).ceil,
                                     0
                                   ].max
                 } if bots[:claybot] > 0 && bots[:obsbot] < blueprint[:max_bots][:obsbot]
      options << { :bot => :claybot,
                   :time_needed => [ ((blueprint[:bot_costs][:claybot][:ore].to_f - resources[:ore]) / bots[:orebot]).ceil,
                                     0
                                   ].max
                 } if bots[:claybot] < blueprint[:max_bots][:claybot]
      options << { :bot => :orebot,
                   :time_needed => [ ((blueprint[:bot_costs][:orebot][:ore].to_f - resources[:ore]) / bots[:orebot]).ceil,
                                     0
                                   ].max
                 } if bots[:orebot] < blueprint[:max_bots][:orebot]
      options
    end

    def find_max_geodes(time_left, blueprint, bots, resources)
      factory_options = factory_options(blueprint, bots, resources, time_left).select { |opt| opt[:time_needed] < time_left }
      if factory_options.empty?
        geodes = resources[:geo] + bots[:geobot] * time_left
        @max_geodes[blueprint[:id]] = geodes if geodes > @max_geodes[blueprint[:id]]
        return
      end

      factory_options.each do |option|
        new_time_left = time_left - option[:time_needed] - 1
        new_resources = resources.clone
        new_bots = bots.clone

        bots.each { |bot, n| new_resources[@resource_from_bot[bot]] += n * option[:time_needed] + n }
        blueprint[:bot_costs][option[:bot]].each { |resource, n| new_resources[resource] -= n }
        new_bots[option[:bot]] += 1

        if (new_resources[:geo] + bots[:geobot] * new_time_left + ((1..new_time_left).inject(:+) || 0)) > @max_geodes[blueprint[:id]]
          find_max_geodes(new_time_left, blueprint, new_bots, new_resources)
        end
      end
    end

    def part1!
      @blueprints.map do |id, blueprint|
        starting_bots = { :orebot => 1, :claybot => 0, :obsbot => 0, :geobot => 0 }
        starting_resources = { :ore => 0, :clay => 0, :obs => 0, :geo => 0 }
        find_max_geodes(24, blueprint, starting_bots, starting_resources)
        id * @max_geodes[id]
      end.sum
    end

    def part2!
      (1..3).map do |i|
        starting_bots = { :orebot => 1, :claybot => 0, :obsbot => 0, :geobot => 0 }
        starting_resources = { :ore => 0, :clay => 0, :obs => 0, :geo => 0 }
        find_max_geodes(32, @blueprints[i], starting_bots, starting_resources)
        @max_geodes[i]
      end.reduce(&:*)
    end

  end
end

