require_relative "../lib/lexographic"


describe Lexographic do 
	
	let(:lexographic) {Lexographic.new(1, 4)}

	it "should create an array of numbers from a start value to an end value" do
		lexographic.lexographic_array.should eq([1, 2, 3, 4])
	end
	
	it "should return the nth lexographic permutation" do
		lexographic.nth_permutation(24).should eq([4, 3, 2, 1])
	end

end