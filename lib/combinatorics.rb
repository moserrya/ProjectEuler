require_relative './factorial'

class Combinatorics
	def self.select_from( r, n )
		n.factorial / ( r.factorial * ( n - r ).factorial )
	end
end