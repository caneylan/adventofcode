
module Aoc2021

  @@input_dir = ::File.expand_path('../input/2021', __dir__)

  def self.input_dir
    @@input_dir
  end

end

require 'aoc2021/solution'
Dir[File.join(__dir__, 'aoc2021', 'day*.rb')].each { |day| require day }

