class Integer
  def factorial
  	return 1 if self == 0
    self.downto(1).inject(:*)
  end
end