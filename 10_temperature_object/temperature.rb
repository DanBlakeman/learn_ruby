class Temperature
  attr_accessor :in_fahrenheit, :in_celsius

  def initialize(temp={})
    @in_fahrenheit = temp[:f]
    @in_celsius = temp[:c]
  end

  def in_celsius
    @in_celsius || (@in_fahrenheit - 32) * 5.0 / 9.0
  end

  def in_fahrenheit
    @in_fahrenheit || (@in_celsius * 1.8) + 32
  end

  def self.from_celsius(num)
    self.new(c: num)
  end

  def self.from_fahrenheit(num)
    self.new(f: num)
  end

end

class Celsius < Temperature

  def initialize(num)
    @in_celsius = num
  end

end

class Fahrenheit < Temperature

  def initialize(num)
    @in_fahrenheit = num
  end

end