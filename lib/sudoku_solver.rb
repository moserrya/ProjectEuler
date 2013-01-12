# This is a Sudoku solver I put together to improve my understanding of constraint 
# propogation and backtracing. The initial state of the puzzle should have zeroes
# or periods for blank squares; all other formatting will be ignored

# This also addresses Project Euler problem #96

class SudokuSolver
	attr_reader :squares, :units, :peers, :unitlist
	attr_reader :values

	def initialize
		@squares = create_squares
		@unitlist = create_unitlist
		@units = create_units
		@peers = create_peers
	end

	def create_squares
		digits = '123456789'
		characters = 'ABCDEFGHI'
		squares = []
		characters.each_char do |character|
			digits.each_char do |digit|
				squares << ( character + digit )
			end
		end
		squares
	end

	def create_unitlist
		unitlist = []
		0.step(80, 9) do |index|
			sublist1, sublist2 = [], []
			(index).upto(index + 8) {|row_index| sublist1 << @squares[row_index] } #create rows
			unitlist << sublist1
		end
		9.times do |index|
			sublist2 = []
			index.step(80, 9) { |square| sublist2 << @squares[square] } #create columns
			unitlist << sublist2
		end
		letters = [%w(A B C), %w(D E F), %w(G H I)]
		numbers = [%w(1 2 3), %w(4 5 6), %w(7 8 9)]
		letters.each do |letter|
			numbers.each do |number|
				sublist3 = []
				letter.each { |letr| number.each { |num| sublist3 << (letr + num) } }
				unitlist << sublist3
			end
		end
		unitlist
	end

	def create_units
		units = Hash.new
		squares.each do |square|
			units[square] ||= []
			unitlist.each do |unit|
				units[square] << unit if unit.include?(square)
			end
		end
		units
	end

	def create_peers
		peers = Hash.new
		squares.each do |square|
			peers[square] = units[square].flatten.uniq - [square]
		end
		peers
	end

	def create_values(grid)
		@grid = grid
		@values = Hash.new
		count = 0
		grid.each_char do |char|
			next unless char =~ /[.0-9]/
			@values[squares[count]] = char =~ /[1-9]/ ? char : "123456789"
			count += 1
		end
		@values
	end

	def constraint_propogation
		before_length = @values.values.join('').length
		@squares.each do |square|
		  return false if @values[square].length == 0
	    if @values[square].length == 1
	      eliminate(square)
	    else
	    	assign(square)
	    end
		end
		constraint_propogation if @values.values.join('').length < before_length
		# search if @values.values.join('').length > 81
	end

	def eliminate(square)
		@peers[square].each do |peer|
			return false if @values[peer].delete(@values[square]).length.zero?
			@values[peer].delete!(@values[square])
		end
	end

	def assign(square)
		@values[square].each_char do |number|
			total = 0
			@peers[square].each do |peer|
				total += 1 if @values[peer].include?(number)
			end
			@values[square] = number if total == 0
			constraint_propogation if total == 0
		end
	end

	def display_table
		puts
		@values.values.each_with_index do |number, index|
			print number << ' '
			print '| ' if (index + 1) % 3 == 0 && (index + 1) % 9 != 0
			puts if (index + 1) % 9 == 0
			puts '------+-------+------' if (index + 1) % 27 == 0 && index != 80
		end
	end

	# def search
	# 	@values = @values.sort_by { |key, value| value.length }.inject({}) {|h,(k,v)| h[k]=v; h}
	# 	@values.each do |key, value|
	# 		if value.length > 1
	# 			value.each_char do |v|
	# 				@values[key] = v
	# 				break unless constraint_propogation
	# 			end
	# 			break if constraint_propogation
	# 		end
	# 	end
	# end
end