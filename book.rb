class Book
  attr_accessor :author, :title, :rentals

  def initialize(title, author)
    @author = author
    @title = title
    @rentals = []
  end
end
