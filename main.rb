require './helpers'
require './add_user'
require './list_book'
require './list_people'
require './list_rental'
require './add_book'
require './add_rental'
require './helpers'

class App
  include ListBook
  include ListPeople
  include ListRental
  include AddUser
  include CreateBook
  include CreateRental
  include Helpers

  def first_display
    puts 'Welcome to School Library App!'
    options
    prompt_user
  end

  def prompt_user
    input = gets.chomp

    if input.to_i.between?(1, 6)
      clear
      selection(input)
    elsif input == '0'
      exit
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
end

app = App.new
app.first_display
