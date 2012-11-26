require_relative "lib/pandigital"
require "prime"

# http://projecteuler.net/problem=41

# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# What is the largest n-digit pandigital prime that exists?

# key insight here is that if the digits in a number add up to three, the number is divisible by
# three and therefore is not prime. hence, only 4 and 7 digit pandigitals can be prime, so we can start 
# by testing only 7 digit pandigitals

# pandigital array returns numbers as strings in ascending order
# reverse to make it descending so the first prime number it finds is the largest
# and you can stop looking

pandigital_array = Pandigital.pandigital_array_maker(7)

pandigital_array.reverse.each do |pandigital_number|
	if pandigital_number.to_i.prime?
		puts pandigital_number
		break
	end
end

# returns 7652413