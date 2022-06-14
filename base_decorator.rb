require './nameable'

class Decorator < Nameable
  def initialize
    super()
    @nameable = Nameable.new
  end

  def correct_name
    @nameable.correct_name(@name)
  end
end
