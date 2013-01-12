require_relative 'lib/combinatorics'

# http://projecteuler.net/problem=53

# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5C3 = 10.

# In general,

# nCr =	n! / (r! (n - r)! )

# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

# How many, not necessarily distinct, values of  nCr, for 1  n  100, 
# are greater than one-million?

vals_over_1m = 0

1.upto(100) do |r|
	r.upto(100) do |n|
		vals_over_1m += 1 if Combinatorics.select_from( r, n ) > 1_000_000
	end
end

puts vals_over_1m