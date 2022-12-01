#!/bin/bash

day=$1
year=$2

if [ -z "$year" ]; then
  year=$(date +%Y)
fi
if [ -z "$day" ]; then
  if [ -d input/${year} ]; then
    last_day=$(find input/${year}/ -maxdepth 1 -regex '.*/day[0-9]*$' | sort | tail -n1 | sed 's,.*/day,,')
    if [ -n "$last_day" ]; then
      day=$(($last_day+1))
    fi
  fi
  if [ -z "$day" ]; then
    day=1
  fi
fi

if ! grep -Eq '^[0-9]{1,2}$' <<< "$day" || ! grep -Eq '^[0-9]{4}$' <<< "$year" ; then
  echo "usage: $0 [day_number] [year]"
  echo "  if year is not specified, then the current year is used"
  exit 1
fi

day=$(printf "%02d" $day)
echo ":: initializing for year $year, day $day"

mkdir -p input/${year}/day${day}
mkdir -p spec/${year}
mkdir -p lib/aoc${year}

touch input/${year}/day${day}/input1
touch input/${year}/day${day}/input1-example

cat > lib/aoc${year}/day${day}.rb <<EOF

module Aoc${year}
  class Day${day} < Solution

    def parse_input
    end

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
    day = Aoc${year}::Day${day}.new ::File.expand_path("../../input/${year}/day${day}/input1-example", __dir__)
    expect(day.part1!).to eq(false)
  end

  #it "solves part 1" do
  #  day = Aoc${year}::Day${day}.new ::File.expand_path("../../input/${year}/day${day}/input1", __dir__)
  #  expect(day.part1!).to eq(false)
  #end

  #it "solves part 2 example" do
  #  day = Aoc${year}::Day${day}.new ::File.expand_path("../../input/${year}/day${day}/input1-example", __dir__)
  #  expect(day.part2!).to eq(false)
  #end

  #it "solves part 2" do
  #  day = Aoc${year}::Day${day}.new ::File.expand_path("../../input/${year}/day${day}/input1", __dir__)
  #  expect(day.part2!).to eq(false)
  #end

end

EOF

if ! [ -f lib/aoc${year}.rb ]; then
  cat > lib/aoc${year}.rb <<EOF

module Aoc${year}
  # hello there
end

require 'aoc${year}/solution'
Dir[File.join(__dir__, 'aoc${year}', 'day*.rb')].each { |day| require day }

EOF
fi

if ! [ -f lib/aoc${year}/solution.rb ]; then
  cat > lib/aoc${year}/solution.rb <<EOF

module Aoc${year}
  class Solution

    attr_reader :input

    def initialize(filename)
      @input = File.readlines(filename).map(&:strip)
      parse_input
    end

    def parse_input
      raise "not implemented"
    end

    def part1!
      raise "not implemented"
    end

    def part2!
      raise "not implemented"
    end

  end
end

EOF
fi

