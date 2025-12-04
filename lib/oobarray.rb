
module OutOfBoundsArray

  # A singleton object that acts like nil but is safe to chain [] and common Array methods
  NIL_ARRAY = Object.new.tap do |o|
    # Indexing always returns itself (so foo[999][123] keeps returning SAFE_NIL)
    def o.[](*)
      self
    end

    # Common enumeration methods – all return empty or safe values
    def o.each(&block)           = [].each(&block)
    def o.map(&block)            = []
    def o.flat_map(&block)       = []
    def o.select(&block)         = []
    def o.filter(&block)         = []
    def o.reject(&block)         = []
    def o.grep(*)                = []
    def o.flatten(*)             = []
    def o.compact                = self
    def o.uniq                   = []
    def o.sort(*)                = []
    def o.join(*)                = ""
    def o.to_a                   = []
    def o.to_ary                  = []
    def o.dig(*)                 = nil
    def o.fetch(*, &block)       = block ? block.call(nil) : nil

    # Enumerable predicates
    def o.any?(*)   = false
    def o.all?(*)   = true
    def o.none?(*)  = true
    def o.one?(*)   = false
    def o.empty?    = true

    # Numeric-like
    def o.length = 0
    def o.size   = 0
    def o.count(*) = 0
    def o.sum(*)   = 0
    def o.min(*)   = nil
    def o.max(*)   = nil
    def o.first(*) = nil
    def o.last(*)  = nil

    # Nice output
    def o.inspect = "nil"
    def o.to_s    = ""

    # Act like nil in conditionals
    def o.nil?    = true
  end.freeze

	def [](index)
		if index < 0 || index >= length
			NIL_ARRAY
		else
			element = super(index)
			if element.is_a?(Array)
				element.extend(OutOfBoundsArray) unless element.is_a?(OutOfBoundsArray)
			end
			element
		end
  end

  # make assignment ignore out-of-bounds indices
  def []=(index, value)
    super(index, value) if index >= 0 && index < length
  end
end

