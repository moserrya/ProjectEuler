require_relative "../lib/sudoku_solver"

describe SudokuSolver do
	let(:sudoku_puzzle) {SudokuSolver.new}

	it "should know the number of squares in a Sudoku puzzle" do
		sudoku_puzzle.squares.length.should eq(81)
	end

	it "should have a list with all of the units in a Sudoku puzzle" do
		sudoku_puzzle.unitlist.length.should eq(27)
	end

	it "should know the units for a given letter" do
		sudoku_puzzle.units['C2'].should eq([['C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'],
																	  		 ['A2', 'B2', 'C2', 'D2', 'E2', 'F2', 'G2', 'H2', 'I2'],
                         		             ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']])
	end

	it "should know the peers for a given letter" do
		sudoku_puzzle.peers['C2'].sort.should eq( ['A2', 'B2', 'D2', 'E2', 'F2', 'G2', 'H2', 
																					'I2', 'C1', 'C3', 'C4', 'C5', 'C6', 'C7', 
																					'C8', 'C9', 'A1', 'A3', 'B1', 'B3'].sort )
	end

	it "should create a values hash from the grid" do
		grid = '003020600900305001001806400008102900700000008006708200002609500800203009005010300'
		sudoku_puzzle.create_values(grid)
		sudoku_puzzle.values['B1'].should eq('9')
		sudoku_puzzle.values['A2'].should eq('123456789')
	end

	it "should use constraint propogation to solve simple puzzles" do
		grid = '003020600900305001001806400008102900700000008006708200002609500800203009005010300'
		sudoku_puzzle.create_values(grid)
		sudoku_puzzle.constraint_propogation
		sudoku_puzzle.display_table
	end

	it "should use constraint propogation to solve simple puzzles" do
		grid = '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
		sudoku_puzzle.create_values(grid)
		sudoku_puzzle.constraint_propogation
		# sudoku_puzzle.values.sort_by { |key, value| key}
		sudoku_puzzle.display_table
	end
end