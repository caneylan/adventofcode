require 'aoc2021'

RSpec.describe Aoc2021::Day13 do

  it "solves part 1 example" do
    day = Aoc2021::Day13.new ::File.expand_path("../../input/2021/day13/input1-example", __dir__)
    expect(day.part1!).to eq(17)
  end

  it "solves part 1" do
    day = Aoc2021::Day13.new ::File.expand_path("../../input/2021/day13/input1", __dir__)
    expect(day.part1!).to eq(661)
  end

  it "solves part 2" do
    day = Aoc2021::Day13.new ::File.expand_path("../../input/2021/day13/input1", __dir__)
    expect(day.part2!).to match_array(
      [
				'###  #### #  # #    #  #  ##  #### ### ',
				'#  # #    # #  #    # #  #  # #    #  #',
				'#  # ###  ##   #    ##   #    ###  #  #',
				'###  #    # #  #    # #  #    #    ### ',
				'#    #    # #  #    # #  #  # #    #   ',
				'#    #    #  # #### #  #  ##  #    #   ',
      ])
  end

end
