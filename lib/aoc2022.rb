
module Aoc2022
  # hello there
end

require_relative File.join(__dir__, 'aoc2022', 'solution.rb')
Dir[File.join(__dir__, 'aoc2022', 'day*.rb')].each { |day| require day }

