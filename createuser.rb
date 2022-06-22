require './student'
require './teacher'

module CreateUser
  def add_user
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '0 - Exit'
    user = gets.chomp

    case user
    when '1'
      print "\e[2J\e[f"
      add_student
    when '2'
      print "\e[2J\e[f"
      add_teacher
    when '0'
      exit
    else
      invalid_prompt
      add_user
    end
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Classroom: '
    classroom = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    parent_permission = permission.downcase == 'y' || permission.downcase == 'yes' || permission == ''
    id = Random.rand(1000..2000)

    update_user(Student.new(id, age, name, classroom, parent_permission: parent_permission))

    response('Student')
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    id = Random.rand(1000..2000)

    update_user(Teacher.new(id, age, name, specialization, parent_permission: true))

    response('Teacher')
  end

  def list_all_people
    user.each do |user|
      puts "[#{user.class}] Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    puts "\n"
    prompt_user
  end
end
