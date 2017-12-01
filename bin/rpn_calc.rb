# RPN Calculator
class RPNCalc
  attr_accessor :stack, :result

  OPERANDS = %w(+ - * /).freeze
  INVALID_ERROR = "Numbers and operators (#{OPERANDS.join(',')}) only!".freeze
  NO_OPERATOR_FIRST = 'First entry must be a number, not an operator.'.freeze

  def initialize
    @stack = []
    @result = nil
  end

  def calculate
    nums = []
    validate_stack
    @stack.each do |item|
      nums << item.to_f if numeric? item
      next unless OPERANDS.include? item
      @result = do_math(nums, item)
      nums = [@result]
    end
  end

  def do_math(nums, operand)
    case operand
    when '+'
      nums.reduce(:+)
    when '-'
      nums.reduce(:-)
    when '*'
      nums.reduce(:*)
    when '/'
      nums.reduce(:/)
    end
  end

  def validate_stack
    exit if @stack.include? 'q'
    @stack.each_with_index do |item, index|
      next if numeric? item
      next if OPERANDS.include?(item) && index > 0
      @stack.delete item
      return puts NO_OPERATOR_FIRST if OPERANDS.include? item
      puts INVALID_ERROR
    end
  end

  def numeric?(item)
    true if Kernel.Float(item)
  rescue TypeError, ArgumentError
    false
  end
end
