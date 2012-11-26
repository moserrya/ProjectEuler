class Lychrel
	def self.is_lychrel(a_number)
		a_number += a_number.to_s.reverse.to_i
		count = 1
		while count <= 50 && a_number != a_number.to_s.reverse.to_i
			a_number += a_number.to_s.reverse.to_i
			count += 1
		end 
		
		return true if count == 51
		false
	end
end