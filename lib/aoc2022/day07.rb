
module Aoc2022
  class Day07 < Solution

    def parse_input
      @fs = current_dir = { :parent_dir => nil, :name => '/', :files => {}, :sub_dirs => {} }
      @input.each do |line|
        case line
        when /^\$ cd \/$/
          current_dir = @fs
        when /^\$ cd \.\.$/
          current_dir = current_dir[:parent_dir]
        when /^\$ cd (.*)$/
          current_dir = current_dir[:sub_dirs][$1]
        when /^dir (.*)$/
          current_dir[:sub_dirs][$1] ||= { :parent_dir => current_dir, :name => $1, :files => {}, :sub_dirs => {} }
        when /^(\d+) (.*)$/
          current_dir[:files][$2] = $1.to_i
        end
      end
      du_fs!(@fs)
      #print_tree(@fs)
    end

    def du_fs!(dir)
      dir[:size] = dir[:files].values.sum + dir[:sub_dirs].map { |name, sub_dir| du_fs!(sub_dir) }.sum
    end

    def find_sizes(dir, op, limit)
      results = []
      results << dir[:size] if dir[:size].send(op, limit)
      results += dir[:sub_dirs].map { |name, sub_dir| find_sizes(sub_dir, op, limit) }.flatten
    end

    def part1!
      find_sizes(@fs, '<=', 100000).sum
    end

    def part2!
      find_sizes(@fs, '>=', @fs[:size] + 30000000 - 70000000).sort.first
    end

    def print_tree(dir, indent = "")
      puts "#{indent}- #{dir[:name]} (dir, size=#{dir[:size]})"
      indent = indent + "  "
      dir[:files].each do |name, size|
        puts "#{indent}- #{name} (file, size=#{size})"
      end
      dir[:sub_dirs].each do |name, sub_dir|
        print_tree(sub_dir, indent)
      end
    end

  end
end

