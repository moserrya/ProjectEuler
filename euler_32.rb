require_relative "lib/pandigital"

# http://projecteuler.net/problem=32

# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; 
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39  186 = 7254, containing multiplicand, multiplier, and 
# product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

# why this solution works: to get to a nine digit number by concatenating the multiplicand, multiplier, and 
# product, it must either be a 1 digit number times a 4 digit number, yielding a 4 digit number or
# a two digit number times a three digit number, again yielding a four digit number.

products=[]

Pandigital.pandigital_array_maker(9).each do |number|
	last4 = number[5..8].to_i
	products << last4 if number[0].to_i * number[1..4].to_i == last4 || number[0..1].to_i * number[2..4].to_i == last4
end

puts products.uniq.inject(:+)