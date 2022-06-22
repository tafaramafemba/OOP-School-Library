require_relative '../teacher'
describe Teacher do
  context 'It should create a teacher' do
    id = 7
    age = 56
    name  = 'Tafara'
    specialization = 'Mathematics'
    teacher = Teacher.new(id, age, name, specialization, parent_permission: true)

    it 'should create an instance of class student' do
      expect(teacher).to be_an_instance_of(Teacher)
    end
  end
end

