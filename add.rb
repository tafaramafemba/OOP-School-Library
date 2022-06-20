class Add
  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @booklist.push(book)
    response('Book ')
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
end