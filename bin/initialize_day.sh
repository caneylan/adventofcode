#!/bin/bash

day=$1
year=$2
[ -z "$year" ] && year=$(date +%Y)

if ! grep -Eq '^[0-9]{1,2}$' <<< "$day" || ! grep -Eq '^[0-9]{4}$' <<< "$year" ; then
  echo "usage: $0 <day_number> [year]"
  echo "  if year is not specified, then the current year is used"
  exit 1
fi

day=$(printf "%02d" $day)

mkdir -p input/${year}/day${day}
touch input/${year}/day${day}/input1
touch input/${year}/day${day}/input1-example

mkdir lib/aoc${year}
cat > lib/aoc${year}/day${day}.rb <<EOF
module Aoc${year}
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

cat > spec/${year}/aoc${year}-day${day}_spec.rb <<EOF
require 'aoc${year}'

RSpec.describe Aoc${year}::Day${day} do

  it "solves part 1 example" do
    day = Aoc${year}::Day${day}.new ::File.expand_path("../input/${year}/day${day}/input1-example", __dir__)
    expect(day.part1!).to eq(false)
  end

  #it "solves part 1" do
  #  day = Aoc${year}::Day${day}.new ::File.expand_path("../input/${year}/day${day}/input1", __dir__)
  #  expect(day.part1!).to eq(false)
  #end

  #it "solves part 2 example" do
  #  day = Aoc${year}::Day${day}.new ::File.expand_path("../input/${year}/day${day}/input1-example", __dir__)
  #  expect(day.part2!).to eq(false)
  #end

  #it "solves part 2" do
  #  day = Aoc${year}::Day${day}.new ::File.expand_path("../input/${year}/day${day}/input1", __dir__)
  #  expect(day.part2!).to eq(false)
  #end

end
EOF

