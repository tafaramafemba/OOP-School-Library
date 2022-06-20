require './student'
require './teacher'
require './book'
require './person'
require './rental'
require './add'
require './list'

class Main # rubocop:disable Metrics/ClassLength
  def initialize
    @booklist = []
    @list_people = []
    @rentals = []
    @add = Add.new
    @list = List.new
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
      @add.add_user
    when '2'
      @add.add_book
    when '3'
      @add.add_rental
    when '4'
      @list.list_all_books
    when '5'
      @list.list_all_people
    when '6'
      @list.list_all_rental_by_id
    end
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

main = Main.new
main.first_display
