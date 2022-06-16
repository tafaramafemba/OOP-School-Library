require './student'
require './teacher'

module AddUser
  def add_user
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '0 - Exit'
    user = gets.chomp

    case user
    when '1'
      clear
      add_student
    when '2'
      clear
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
    gets.chomp

    print 'Name: '
    gets.chomp

    print 'Has parent permission? [Y/N]: '
    gets.chomp

    permission.downcase == 'y' || permission.downcase == 'yes' || permission == ''

    response('Student')
  end

  def add_teacher
    print 'Age: '
    gets.chomp

    print 'Name: '
    gets.chomp

    print 'Specialization: '
    gets.chomp

    response('Teacher')
  end
end
