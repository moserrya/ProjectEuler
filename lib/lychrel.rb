class Lychrel
	def self.is_lychrel(a_number)
		a_number += a_number.to_s.reverse.to_i
		count = 1
		
		# assumes a number that does not become a palindrome in 50 iterations of adding the number
		# to its reverse. 10677 is one known exception to this rule
		
		while count <= 50 && a_number != a_number.to_s.reverse.to_i
			a_number += a_number.to_s.reverse.to_i
			count += 1
		end 
		
		return true if count == 51 || a_number == 10677
		false
	end
end