require_relative "../lib/prime_numbers"

describe Primes do
	it "should return 953 as the longest sum of consecutive primes 
	that adds to a prime below one-thousand" do
		Primes.longest_sum_under(1000).should eq(953)
	end
end