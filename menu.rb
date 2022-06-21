require './helpers'
require './createuser'
require './list'
require './add'
require './preservedata'

class Menu
  include Helpers
  include CreateUser
  include List
  include Add
  include PreserveData

  attr_reader :users, :books, :rentals

  def initialize
    @booklist = []
    @list_people = []
    @rentals = []
    @fstudent = fetch_student
    @fteacher = fetch_teacher
    @fbooks = fetch_books
    @frentals = fetch_rentals
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

  def update_student(user)
    @fstudent << user
    save_student(user)
  end

  def update_teacher(user)
    @fstudent << user
    save_teacher(user)
  end

  def update_books(book)
    @fbooks << book
    save_book(book)
  end

  def update_rentals(rental)
    @frentals << rental
    save_rental(rental)
  end
end
