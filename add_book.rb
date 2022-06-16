require './book'

module CreateBook
  def add_book
    print 'Title: '
    gets.chomp

    print 'Author: '
    gets.chomp
    response('Book ')
  end
end
