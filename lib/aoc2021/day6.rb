
module Aoc2021
  class Day6 < Solution

    def fish_simulation!(days)
      # fish cycle from 0 to 6, reproducing on the last day
      fish_school_cycle_cap = 7

      # fish_school maps the reproduce-day of fish on day 0 to how many such fish there are for adults
      fish_school = Array.new(fish_school_cycle_cap, 0)

      # children need 2 extra days before they enter their reproductive cycle
      fish_children_one_day_away = fish_children_two_days_away = 0

      # initialize the school
      input.first.split(',').each { |fish| fish_school[fish.to_i] += 1 }

      # simulate!
      (1..days).each do |day|
        # rotate the children
        new_adults = fish_children_one_day_away
        fish_children_one_day_away = fish_children_two_days_away
        fish_children_two_days_away = 0

        # fish on day 6 reproduce
        last_spawn = (fish_school_cycle_cap + day - 1) % fish_school_cycle_cap
        fish_children_two_days_away = fish_school[last_spawn]

        # add new adults into the reproductive cycle
        fish_school[last_spawn] += new_adults
      end

      return fish_school.sum + fish_children_one_day_away + fish_children_two_days_away
    end

  end
end


