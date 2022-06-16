require './helpers'
require './app'

class Main
  include Helpers
  def initialize
    @app = App.new
  end

  def first_display
    puts 'Welcome to School Library App!'
    prompt_user
  end

  def prompt_user
    options
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
      @app.add_user
    when '2'
      @app.add_book
    when '3'
      @app.add_rental
    when '4'
      @app.list_all_books
    when '5'
      @app.list_all_people
    when '6'
      @app.list_all_rental_by_id
    end
  end
end

main = Main.new
main.first_display
