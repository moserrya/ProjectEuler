require_relative "../lib/lychrel"

describe Lychrel do
	it "should return true when given a Lychrel number" do
		Lychrel.is_lychrel(196).should eq(true)
	end
end