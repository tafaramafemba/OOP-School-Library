require './person'

class Teacher < Person
  def initialize(name = "unknown", age, parent_permission = true, specialization: nil)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end