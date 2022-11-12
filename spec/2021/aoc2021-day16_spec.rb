require 'aoc2021'

RSpec.describe Aoc2021::Day16 do

  it "parses packet example 1" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input1-example", __dir__)
    expect(day.parse_packet!).to eq({
      :version => 6,
      :version_sum => 6,
      :type => 4,
      :is_operator => false,
      :length => "110100101111111000101".length,
      :value => 2021,
    })
  end

  it "parses packet example 2" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input1-example2", __dir__)
    expect(day.parse_packet!).to eq({
      :version => 1,
      :version_sum => 9,
      :type => 6,
      :is_operator => true,
      :length => 49,
      :payload_length_type => 0,
      :payload_length => 27,
      :payload => [
        { :version => 6, :version_sum => 6, :type => 4, :is_operator => false, :length => 11, :value => 10 },
        { :version => 2, :version_sum => 2, :type => 4, :is_operator => false, :length => 16, :value => 20 },
      ],
    })
  end

  it "parses packet example 3" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input1-example3", __dir__)
    expect(day.parse_packet!).to eq({
      :version => 7,
      :version_sum => 14,
      :type => 3,
      :is_operator => true,
      :length => 51,
      :payload_length_type => 1,
      :payload_count => 3,
      :payload => [
        { :version => 2, :version_sum => 2, :type => 4, :is_operator => false, :length => 11, :value => 1 },
        { :version => 4, :version_sum => 4, :type => 4, :is_operator => false, :length => 11, :value => 2 },
        { :version => 1, :version_sum => 1, :type => 4, :is_operator => false, :length => 11, :value => 3 },
      ],
    })
  end

  it "solves part 1 example 4" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input1-example4", __dir__)
    expect(day.part1!).to eq(16)
  end

  it "solves part 1" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input1", __dir__)
    expect(day.part1!).to eq(852)
  end

  it "solves part 2 example 1" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input2-example1", __dir__)
    expect(day.part2!).to eq(3)
  end

  it "solves part 2 example 2" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input2-example2", __dir__)
    expect(day.part2!).to eq(1)
  end

  it "solves part 2" do
    day = Aoc2021::Day16.new ::File.expand_path("../input/2021/day16/input1", __dir__)
    expect(day.part2!).to eq(19348959966392)
  end

end
