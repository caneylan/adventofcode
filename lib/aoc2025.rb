
module Aoc2025
  # hello there
end

require_relative File.join(__dir__, 'aoc2025', 'solution.rb')
Dir[File.join(__dir__, 'aoc2025', 'day*.rb')].each { |day| require day }

