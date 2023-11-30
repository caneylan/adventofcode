
module Aoc2023
  # hello there
end

require_relative File.join(__dir__, 'aoc2023', 'solution.rb')
Dir[File.join(__dir__, 'aoc2023', 'day*.rb')].each { |day| require day }

