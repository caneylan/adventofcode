
require 'aoc2021'

RSpec.describe Aoc2021 do
  test_filename = ::File.expand_path('../input/test', __dir__)
  context "module" do
    it { is_expected.to be_a(Module) }
  end

  context "Solution" do
    it "defines a Solution parent class" do
      s = Aoc2021::Solution.new(test_filename)
      expect(s).to_not be_nil
    end
    it "defines an accessor for provided input" do
      s = Aoc2021::Solution.new(test_filename)
      expect(s.input).to eq(['hello there'])
    end
    it "provides a solve method stub that needs to be implemented" do
      s = Aoc2021::Solution.new(test_filename)
      expect(s).to respond_to(:solve)
      expect { s.solve }.to raise_error("not implemented")
    end
  end

  context "day classes" do
    it "only provides DayX classes that are Solutions" do
      Aoc2021.constants.select { |c|
        c =~ /^Day\d/
      }.map { |c|
        Aoc2021.const_get(c)
      }.select { |c|
        c.is_a?(Class)
      }.each { |c|
        expect(c).to be < Aoc2021::Solution
      }
    end
  end

end

