require './nameable'

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @nameable = Nameable.new
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission && of_age?
  end

  def correct_name_valid
    @nameable.correct_name(@name)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
