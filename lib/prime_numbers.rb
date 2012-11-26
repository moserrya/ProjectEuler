require 'prime'

class Primes
	def self.longest_sum_under(a_number)
		prime_number_array = Prime::EratosthenesGenerator.new.take_while {|i| i <= a_number}
		longest_sum = 2
		max_length = 1

		prime_number_array.each_with_index do |number, index|
			candidate_longest_number = number
			i = 1
			while (index + i) < prime_number_array.length
				candidate_longest_number += prime_number_array[index + i]
				break if candidate_longest_number > a_number
				i += 1
				max_length = i if i > max_length && candidate_longest_number.prime?
				longest_sum = candidate_longest_number if max_length == i && candidate_longest_number.prime?
			end
		end
		longest_sum
	end
end