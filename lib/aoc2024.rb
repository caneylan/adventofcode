
module Aoc2024
  # hello there
end

require_relative File.join(__dir__, 'aoc2024', 'solution.rb')
Dir[File.join(__dir__, 'aoc2024', 'day*.rb')].each { |day| require day }

