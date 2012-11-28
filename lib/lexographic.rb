require_relative 'factorial'

class Lexographic
	
	attr_reader :lexographic_array

	def create_lexographic_array(start_number, end_number)
		lexographic_array = []
		(start_number..end_number).each do |number|
			lexographic_array.push(number)
		end
		lexographic_array
	end

	def initialize(start_number, end_number)
		@lexographic_array = create_lexographic_array(start_number, end_number)
	end

	# n elements in order always have n! permutations - nth permutation takes advantage of that fact

	def nth_permutation(number_of_permutations)
		permutation_array = []
		number_of_permutations -= 1 # assuming we start from the first permutation rather than the zeroth
		while lexographic_array.length > 0
			index = number_of_permutations / (lexographic_array.length - 1).factorial
			number_of_permutations %= (lexographic_array.length - 1).factorial
			permutation_array.push(lexographic_array.delete_at(index))
		end
		permutation_array
	end

end