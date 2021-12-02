
require 'aoc2021'

RSpec.describe Aoc2021 do
  context "module" do
    it { is_expected.to be_a(Module) }
  end

  context "input_dir" do
    it "defines input_dir" do
      expect(Aoc2021.input_dir).to be_a(String)
    end
    it "defines an input_dir that exists" do
      expect(Aoc2021.input_dir).to satisfy { |d| ::File.directory?(d) }
    end
  end

  context "Solution" do
    it "defines a Solution parent class" do
      s = Aoc2021::Solution.new
      expect(s).to_not be_nil
    end
    it "provides a solve method stub that needs to be implemented" do
      s = Aoc2021::Solution.new
      expect(s).to respond_to(:solve)
      expect { s.solve }.to raise_error("not implemented")
    end
    it "provides a input_path method" do
      s = Aoc2021::Solution.new
      expect(s).to respond_to(:input_path)
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
        s = c.new
        expect(s).to_not be_nil
      }
    end
  end

end

