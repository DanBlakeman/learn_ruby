class RPNCalculator
  attr_accessor :value

  def initialize
    @stack = []
  end

  def push(num)
    @stack.push(num)
  end

  def check_stack
    raise "calculator is empty" if @stack.length < 2
  end

  def plus
    check_stack
    @stack << @stack.pop + @stack.pop
  end

  def minus
    check_stack
    last = @stack.pop
    penultimate = @stack.pop
    @stack << penultimate - last
  end

  def times
    check_stack
    @stack << @stack.pop * @stack.pop
  end

  def divide
    check_stack
    last = @stack.pop
    penultimate = @stack.pop
    @stack << penultimate.to_f / last
  end

  def value
    @stack[-1]
  end

  def tokens(str)
     str.split(" ").map{|char| char.match(/[0-9]/) ? char.to_i : char.to_sym}
  end

  def evaluate(str)
    symbol_map = {:+ => self.method("plus"),
                  :- => self.method("minus"),
                  :* => self.method("times"),
                  :/ => self.method("divide")}

      tokens(str).each { |element| element.is_a?(Fixnum) ? push(element) : symbol_map[element].call }

    value
  end

end