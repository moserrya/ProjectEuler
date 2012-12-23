class Pandigital
	def self.pandigital_array_maker(number_of_digits, start_number = 1, my_array = ["#{start_number}"])
		pandigital_array = []
		
		return my_array if number_of_digits == 1

		my_array.each do |pandigital_term|

			(pandigital_term.length + 1).times do |index|
				pandigital_array.push(pandigital_term.insert(index, (pandigital_term.length + start_number).to_s))
				pandigital_term = pandigital_term.delete((pandigital_term.length - 1 + start_number).to_s)
			end
		end

		return pandigital_array_maker(number_of_digits - 1, start_number, pandigital_array).sort
	end

	def self.sub_string_divisibility(pandigital_number)
		primes = [2, 3 ,5, 7, 11, 13, 17]
		pandigital_number = pandigital_number.to_s
		unusual_property = false
		
		primes.length.times do |index|
			if (pandigital_number[1+index..3+index].to_i % primes[index]).zero?
				unusual_property = true
			else
				unusual_property = false
			end
			break if unusual_property == false
		end

		unusual_property
	end
	
end