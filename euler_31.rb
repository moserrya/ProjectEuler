# Note: This also solves problems 76 and 77

class IntegerPartition

	attr_accessor :parts

	def initialize
		@parts = [1, 2, 5, 10, 20, 50, 100, 200]
	end

	def solve( target  )
	  ways = [1] + [0] * target
	  @parts.each do |part|
	    part.upto(target).each do |x|
	      ways[x] += ways[x - part]
	    end
	  end
	  ways[target]
	end

end

# coin = IntegerPartition.new

# # coin.parts = (1..99).to_a

# puts coin.solve(200)

coin = IntegerPartition.new

coin.parts = [1]

until ( coin.solve( coin.parts.last ) % 1_000_000 ).zero?
	coin.parts << coin.parts.last + 1
	puts coin.parts.last
end

puts coin.parts.last