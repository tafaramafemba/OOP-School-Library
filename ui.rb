require './student'
require './teacher'
require './book'
require './person'
require './rental'

class UI # rubocop:disable Metrics/ClassLength
  def initialize
    @booklist = []
    @list_people = []
    @rentals = []
  end

  def first_display
    puts 'Welcome to School Library App!'
    prompt_user
  end

  def prompt_user
    options
    input = gets.chomp

    if input.to_i.between?(1, 6)
      print "\e[2J\e[f"
      selection(input)
    elsif input == '0'
      print "\e[2J\e[f"
      nil
    else
      invalid_prompt
      prompt_user
    end
  end

  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - Create a user'
    puts '2 - Create a book'
    puts '3 - Create a rental'
    puts '4 - List all books'
    puts '5 - List all people'
    puts '6 - List all rentals by user id'
    puts '0 - Exit'
  end

  def selection(input)
    case input
    when '1'
      add_user
    when '2'
      add_book
    when '3'
      add_rental
    when '4'
      list_all_books
    when '5'
      list_all_people
    when '6'
      list_all_rental_by_id
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @booklist.push(book)
    response('Book ')
  end

  def list_all_books
    @booklist.each do |book|
      puts "Title: #{book.title} | Author: #{book.author}"
    end
    puts "\n"
    prompt_user
  end

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

    student = Student.new(age, name, classroom, parent_permission: parent_permission)

    @list_people.push(student)

    response('Student')
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization, parent_permission: true)
    @list_people.push(teacher)
    response('Teacher')
  end

  def list_all_people
    @list_people.each do |user|
      puts "[#{user.class}] Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    puts "\n"
    prompt_user
  end

  def add_rental
    puts 'select a book from the following list by number (not ID):'
    @booklist.each_with_index do |book, index|
      puts "[#{index}] Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'select a person from the following list by number (not ID):'
    @list_people.each_with_index do |person, index|
      puts "[#{index}] [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Enter the Date of rental (YYYY-MM-DD):'
    date = gets.chomp
    rental = Rental.new(date, @booklist[book_index], @list_people[person_index])
    @rentals.push(rental)

    puts 'Rental created!'
    prompt_user
  end

  def list_all_rental_by_id
    print 'ID of person: '
    user_id = gets.chomp.to_i

    puts "Rentals: #{user_id}"
    @rentals.each do |rental|
      if rental.person.id == user_id
        puts "[#{rental.person.class}] Name: #{rental.person.name}
      | Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    puts "\n"
    prompt_user
  end

  # helpers
  def response(name)
    sleep 1
    puts "\n#{name} created successfully!!!"
    sleep 1
    clear
    prompt_user
  end

  def continue?
    print "\nDo you wish to continue? [Y/N]: "
    answer = gets.chomp

    if answer.downcase == 'y' || answer.downcase == 'yes' || answer == ''
      clear
      prompt_user
    else
      exit
    end
  end

  def invalid_prompt
    clear
    puts 'Incorrect selection, please try again!'

    sleep 1
  end

  def clear
    print "\e[2J\e[f"
  end

  def exit
    clear
    nil
  end
end