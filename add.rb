require './book'
require './rental'

module Add
  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    update_books(Book.new(title, author))
    response('Book ')
  end

  def add_rental
    puts 'select a book from the following list by number (not ID):'
    books.each_with_index do |book, index|
      puts "[#{index}] Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'select a person from the following list by number (not ID):'
    user.each_with_index do |person, index|
      puts "[#{index}] [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Enter the Date of rental (YYYY-MM-DD):'
    date = gets.chomp
    update_rentals(Rental.new(date, books[book_index], user[person_index]))

    puts 'Rental created!'
    prompt_user
  end
end
