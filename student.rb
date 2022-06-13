require './person'

class Student < Person
  def initialize(name = "unknown", age, parent_permission = true, classroom: nil)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
