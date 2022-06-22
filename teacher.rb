require './person'

class Teacher < Person
  def initialize(id, age, name, specialization, parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
