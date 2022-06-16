require './book'

module CreateBook
  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    response('Book ')
  end
end
