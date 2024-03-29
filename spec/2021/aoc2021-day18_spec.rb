require 'aoc2021'

RSpec.describe Aoc2021::Day18 do

  it "determines example magnitudes" do
    day = Aoc2021::Day18.new ::File.expand_path("../input/test", __dir__)
    expect(day.snail_num_magnitude("[[1,2],[[3,4],5]]")).to eq(143)
    expect(day.snail_num_magnitude("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]")).to eq(1384)
    expect(day.snail_num_magnitude("[[[[1,1],[2,2]],[3,3]],[4,4]]")).to eq(445)
    expect(day.snail_num_magnitude("[[[[3,0],[5,3]],[4,4]],[5,5]]")).to eq(791)
    expect(day.snail_num_magnitude("[[[[5,0],[7,4]],[5,5]],[6,6]]")).to eq(1137)
    expect(day.snail_num_magnitude("[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]")).to eq (3488)
    expect(day.snail_num_magnitude("[[[[6,6],[7,6]],[[7,7],[7,0]]],[[[7,7],[7,7]],[[7,8],[9,9]]]]")).to eq(4140)
  end

  it "explodes example numbers" do
    day = Aoc2021::Day18.new ::File.expand_path("../input/test", __dir__)
    expect(day.explode_snail_num("[[[[[9,8],1],2],3],4]")).to eq("[[[[0,9],2],3],4]")
    expect(day.explode_snail_num("[7,[6,[5,[4,[3,2]]]]]")).to eq("[7,[6,[5,[7,0]]]]")
    expect(day.explode_snail_num("[[6,[5,[4,[3,2]]]],1]")).to eq("[[6,[5,[7,0]]],3]")
    expect(day.explode_snail_num("[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]")).to eq("[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]")
    expect(day.explode_snail_num("[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]")).to eq("[[3,[2,[8,0]]],[9,[5,[7,0]]]]")
    expect(day.explode_snail_num("[[3,[2,[8,0]]],[9,[5,[4,2]]]]]")).to eq(nil)
  end

  it "splits example numbers" do
    day = Aoc2021::Day18.new ::File.expand_path("../input/test", __dir__)
    expect(day.split_snail_num("[[[[0,7],4],[15,[0,13]]],[1,1]]")).to eq("[[[[0,7],4],[[7,8],[0,13]]],[1,1]]")
    expect(day.split_snail_num("[[[[0,7],4],[[7,8],[0,13]]],[1,1]]")).to eq("[[[[0,7],4],[[7,8],[0,[6,7]]]],[1,1]]")
    expect(day.split_snail_num("[[[[0,7],4],[7,[[8,4],9]]],[1,1]]")).to eq(nil)
  end

  it "reduces example numbers" do
    day = Aoc2021::Day18.new ::File.expand_path("../input/test", __dir__)
    expect(day.reduce_snail_num("[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]")).to eq("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]")
    expect(day.reduce_snail_num("[[[[[6,6],[6,6]],[[6,0],[6,7]]],[[[7,7],[8,9]],[8,[8,1]]]],[2,9]]")).to eq("[[[[6,6],[7,7]],[[0,7],[7,7]]],[[[5,5],[5,6]],9]]")
  end

  it "adds example numbers" do
    day = Aoc2021::Day18.new ::File.expand_path("../input/test", __dir__)
    expect(day.snail_num_addition(%w{
                                    [1,1]
                                    [2,2]
                                    [3,3]
                                    [4,4]
                                  })).to eq("[[[[1,1],[2,2]],[3,3]],[4,4]]")
    expect(day.snail_num_addition(%w{
                                    [1,1]
                                    [2,2]
                                    [3,3]
                                    [4,4]
                                    [5,5]
                                  })).to eq("[[[[3,0],[5,3]],[4,4]],[5,5]]")
    expect(day.snail_num_addition(%w{
                                    [1,1]
                                    [2,2]
                                    [3,3]
                                    [4,4]
                                    [5,5]
                                    [6,6]
                                  })).to eq("[[[[5,0],[7,4]],[5,5]],[6,6]]")
    expect(day.snail_num_addition(%w{
                                    [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
                                    [7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
                                  })).to eq("[[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]")
    expect(day.snail_num_addition(%w{
                                    [[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]
                                    [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
                                  })).to eq("[[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]")
    expect(day.snail_num_addition(%w{
                                    [[[[6,7],[6,7]],[[7,7],[0,7]]],[[[8,7],[7,7]],[[8,8],[8,0]]]]
                                    [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
                                  })).to eq("[[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]")
    expect(day.snail_num_addition(%w{
                                    [[[[7,0],[7,7]],[[7,7],[7,8]]],[[[7,7],[8,8]],[[7,7],[8,7]]]]
                                    [7,[5,[[3,8],[1,4]]]]
                                  })).to eq("[[[[7,7],[7,8]],[[9,5],[8,7]]],[[[6,8],[0,8]],[[9,9],[9,0]]]]")
    expect(day.snail_num_addition(%w{
                                    [[[[7,7],[7,8]],[[9,5],[8,7]]],[[[6,8],[0,8]],[[9,9],[9,0]]]]
                                    [[2,[2,2]],[8,[8,1]]]
                                  })).to eq("[[[[6,6],[6,6]],[[6,0],[6,7]]],[[[7,7],[8,9]],[8,[8,1]]]]")
    expect(day.snail_num_addition(%w{
                                    [[[[6,6],[6,6]],[[6,0],[6,7]]],[[[7,7],[8,9]],[8,[8,1]]]]
                                    [2,9]
                                  })).to eq("[[[[6,6],[7,7]],[[0,7],[7,7]]],[[[5,5],[5,6]],9]]")
    expect(day.snail_num_addition(%w{
                                    [[[[6,6],[7,7]],[[0,7],[7,7]]],[[[5,5],[5,6]],9]]
                                    [1,[[[9,3],9],[[9,0],[0,7]]]]
                                  })).to eq("[[[[7,8],[6,7]],[[6,8],[0,8]]],[[[7,7],[5,0]],[[5,5],[5,6]]]]")
    expect(day.snail_num_addition(%w{
                                    [[[[7,8],[6,7]],[[6,8],[0,8]]],[[[7,7],[5,0]],[[5,5],[5,6]]]]
                                    [[[5,[7,4]],7],1]
                                  })).to eq("[[[[7,7],[7,7]],[[8,7],[8,7]]],[[[7,0],[7,7]],9]]")
    expect(day.snail_num_addition(%w{
                                    [[[[7,7],[7,7]],[[8,7],[8,7]]],[[[7,0],[7,7]],9]]
                                    [[[[4,2],2],6],[8,7]]
                                  })).to eq("[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]")
    expect(day.snail_num_addition(%w{
                                    [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
                                    [7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
                                    [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
                                    [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
                                    [7,[5,[[3,8],[1,4]]]]
                                    [[2,[2,2]],[8,[8,1]]]
                                    [2,9]
                                    [1,[[[9,3],9],[[9,0],[0,7]]]]
                                    [[[5,[7,4]],7],1]
                                    [[[[4,2],2],6],[8,7]]
                                  })).to eq("[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]")
    expect(day.snail_num_addition(%w{
                                    [[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
                                    [[[5,[2,8]],4],[5,[[9,9],0]]]
                                    [6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
                                    [[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
                                    [[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
                                    [[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
                                    [[[[5,4],[7,7]],8],[[8,3],8]]
                                    [[9,3],[[9,9],[6,[4,9]]]]
                                    [[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
                                    [[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
                                  })).to eq("[[[[6,6],[7,6]],[[7,7],[7,0]]],[[[7,7],[7,7]],[[7,8],[9,9]]]]")
  end

  it "solves part 1 example" do
    day = Aoc2021::Day18.new ::File.expand_path("../../input/2021/day18/input1-example", __dir__)
    expect(day.part1!).to eq(4140)
  end

  it "solves part 1" do
    day = Aoc2021::Day18.new ::File.expand_path("../../input/2021/day18/input1", __dir__)
    expect(day.part1!).to eq(4116)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day18.new ::File.expand_path("../../input/2021/day18/input1-example", __dir__)
    expect(day.part2!).to eq(3993)
  end

  it "solves part 2" do
    day = Aoc2021::Day18.new ::File.expand_path("../../input/2021/day18/input1", __dir__)
    expect(day.part2!).to eq(4638)
  end

end
