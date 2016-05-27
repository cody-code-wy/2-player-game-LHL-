class Question
  attr_accessor :num_a
  attr_accessor :num_b
  attr_accessor :operator

  def initialize
    @num_a = Random.rand(21)
    @num_b = Random.rand(21)
    @operator = Random.rand(5)
  end
  
  def check_answer(answer)
    answer_num = answer.scan(/\d*/)[0].to_i
    self.get_answer== answer_num
  end

  def to_s
    "What is #{@num_a} #{self.get_op_str} #{@num_b} = "
  end

  def get_answer()
    case @operator
      when 0
        @num_a + @num_b
      when 1
        @num_a - @num_b
      when 2
        @num_a * @num_b
      when 3
        @num_a / @num_b
      else
        @num_a % @num_b
      end
  end
  
  def get_op_str()
    @operator == 0 ? '+' : @operator == 1 ? '-' : @operator == 2 ? '*' : @operator == 3 ? '/' : '%'
  end

end
