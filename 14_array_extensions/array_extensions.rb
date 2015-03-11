class Array

  def sum
    self.empty? ? 0 : self.inject(:+)
  end

  def square
    self.empty? ? self : self.map {|value| value ** 2}
  end

  def square!
    self.empty? ? self : self.map! {|value| value ** 2}
  end

end