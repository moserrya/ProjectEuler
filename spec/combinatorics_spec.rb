require_relative "../lib/combinatorics.rb"

describe Combinatorics do 

	it "should send three messages to factorial" do
		Combinatorics.select_from( 10, 23 ).should eq( 1144066 )
	end
	
end