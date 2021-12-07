#!/bin/bash

day=$1

if ! egrep -q '^[0-9]+$' <<< "$day" ; then
  echo "usage: $0 <day_number>"
  exit 1
fi

touch input/2021/day${day}/input1
touch input/2021/day${day}/input1-example

cat > lib/aoc2021/day${day}.rb <<EOF
module Aoc2021
  class Day${day} < Solution

    def part1!
      return false
    end

    def part2!
      return false
    end

  end
end
EOF

cat > spec/aoc2021-day${day}_spec.rb <<EOF
require 'aoc2021'

RSpec.describe Aoc2021::Day${day} do

  it "solves part 1 example" do
    day = Aoc2021::Day${day}.new ::File.expand_path("../input/2021/day${day}/input1-example", __dir__)
    expect(day.part1!).to eq(false)
  end

  #it "solves part 1" do
  #  day = Aoc2021::Day${day}.new ::File.expand_path("../input/2021/day${day}/input1", __dir__)
  #  expect(day.part1!).to eq(false)
  #end

  #it "solves part 2 example" do
  #  day = Aoc2021::Day${day}.new ::File.expand_path("../input/2021/day${day}/input1-example", __dir__)
  #  expect(day.part2!).to eq(false)
  #end

  #it "solves part 2" do
  #  day = Aoc2021::Day${day}.new ::File.expand_path("../input/2021/day${day}/input1", __dir__)
  #  expect(day.part2!).to eq(false)
  #end

end
EOF

