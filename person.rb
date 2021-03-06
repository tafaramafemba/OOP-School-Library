require './nameable'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission && of_age?
  end

  def correct_name
    name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
