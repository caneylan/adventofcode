
# this is a generic multi-dimensional cuboid
# that implements intersection and subtraction so i never have to again

class Cuboid

  attr_reader :dimensions, :order

  def initialize(dimensions)
    raise "bad input: dimensions not an array" unless dimensions.is_a?(Array)
    raise "bad input: dimensions not an array of ranges" unless dimensions.to_a.reject { |d| d.is_a?(Range) }.empty?
    @dimensions = dimensions.to_a
    @order = @dimensions.length
  end

  def inspect
    'Cuboid(' + self.size + '{' + @dimensions.map { |d| d.inspect }.join(',') + '}'
  end
  alias_method :to_s, :inspect

  # how big
  def size
    @dimensions.reduce(1) { |p, d| p * d.size }
  end

  # returns the i'th dimension of this cube
  def [](index)
    @dimensions[index]
  end

  # true or false, does self intersect other?
  def intersects?(other)
    raise "my order is #{self.order} but other's is #{other.order}" unless self.order == other.order
    @dimensions.each_with_index do |d, i|
      return false unless d.min <= other[i].max && d.max >= other[i].min
    end
    true
  end

  # if self and other intersect, then return the cube of that intersection
  def intersection(other)
    raise "my order is #{self.order} but other's is #{other.order}" unless self.order == other.order
    return nil unless self.intersects?(other)
    Cuboid.new(@dimensions.each_with_index.map do |d, i|
      [d.min, other[i].min].max .. [d.max, other[i].max].min
    end)
  end
  alias_method :&, :intersection

  # if self and other intersect, then return the cubes of self
  # that remain with other taken away
  def subtract(other)
    overlap = self.intersection(other)
    return nil unless overlap
    new_cubes = []

    # chop off the bit of self that's above and/or below other in the last axis
    if self[-1].max > other[-1].max
      new_cubes << Cuboid.new(@dimensions[0..-2] + [(other[-1].max + 1)..self[-1].max])
    end
    if self[-1].min < other[-1].min
      new_cubes << Cuboid.new(@dimensions[0..-2] + [self[-1].min..(other[-1].min - 1)])
    end

    # for each axis after the end, 
    # chop off the remaining bit of self that's above and/or below other in the each further axis down
    (self.order - 2).downto(0) do |i|
      front_dims = (i == 0 ? [] : @dimensions[0..(i - 1)])
      rear_overlaps = overlap[(i + 1)..-1]
      if self[i].max > other[i].max
        new_cubes << Cuboid.new(front_dims + [(other[i].max + 1)..self[i].max] + rear_overlaps)
      end
      if self[i].min < other[i].min
        new_cubes << Cuboid.new(front_dims + [self[i].min..(other[i].min - 1)] + rear_overlaps)
      end
    end
    return new_cubes
  end
  alias_method :-, :subtract

  # break up a list of possibly overlapping cubes into the
  # set of cubes representing the unique space consumed
  def self.unique(cubes)
    all_cubes = []
    cubes.each_with_index do |cube, i|
      unique_cubes = [cube]
      (i+1).upto(cubes.length - 1) do |j|
        other_cube = cubes[j]
        new_unique = []
        unique_cubes.each do |c|
          diff = c - other_cube
          if diff
            new_unique += diff
          else
            new_unique << c
          end
        end
        unique_cubes = new_unique
      end
      all_cubes += unique_cubes
    end
    return all_cubes
  end

end

