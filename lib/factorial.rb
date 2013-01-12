class Integer
  def factorial
    self.downto(1).inject(:*) || 1
  end
end