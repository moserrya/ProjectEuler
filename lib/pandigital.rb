class Pandigital
	def self.pandigital_array_maker(number_of_digits, my_array = ["1"])
		pandigital_array = []
		return my_array if number_of_digits == 1

		my_array.each do |pandigital_term|

			(pandigital_term.length + 1).times do |index|
				pandigital_array.push(pandigital_term.insert(index, (pandigital_term.length + 1).to_s))
				pandigital_term = pandigital_term.delete((pandigital_term.length).to_s)
			end
		end

		return pandigital_array_maker(number_of_digits - 1, pandigital_array).sort
	end
	
end