require_relative "../lib/pandigital"


describe Pandigital do
	
	let(:pandigital_array) {Pandigital.pandigital_array_maker(4)}

	it "should return an array of pandigital numbers where the length is equal to
	 the number of digits - factorial" do
	  pandigital_array.length.should eq(24)
	end

	it "should return a sorted array" do
		pandigital_array[-1].should eq("4321")
	end
end