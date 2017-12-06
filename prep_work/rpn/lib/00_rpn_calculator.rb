class RPNCalculator
  # TODO: your code goes here!
  def initialize
    @stack = []
  end
  
  def push(num)
    @stack << num
  end

  def value
    @stack.last
  end

  def evaluate(string)
    tokens(string).each do |token|
      case token
      when Integer
        push(token)
      when Symbol
        perform_operation(token)
      end
    end

    value
  end

  def plus
    perform_operation(:+)
  end

  def minus
    perform_operation(:-)
  end

  def divide
    perform_operation(:/)
  end

  def times
    perform_operation(:*)
  end

  def tokens(string)
    string.split(" ").map {|char| operation?(char) ? char.to_sym : Integer(char)}
  end


  private
  def operation?(char)
    [:+, :-, :*, :/].include?(char.to_sym)
  end

  def perform_operation(sym_to_do)
    raise "calculator is empty" unless @stack.count >= 2
    num2 = @stack.pop
    num1 = @stack.pop

    case sym_to_do
    when :+
      @stack << num1 + num2
    when :-
      @stack << num1 - num2
    when :*
      @stack << num1 * num2
    when :/
      @stack << num1.fdiv(num2)
    else
      @stack << num1 << num2
      raise ArgumentError.new("The operation #{sym_to_do} is not my math")
    end

    self
  end


end



