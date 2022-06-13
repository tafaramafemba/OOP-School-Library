class Person
  attr_reader: id
  attr_accessor : name : age

  def initialize(name = "unknown", age, parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission && of_age?
  end

  private

  def is_of_age?
    if age >= 18
      true
    else false
    end
  end
end