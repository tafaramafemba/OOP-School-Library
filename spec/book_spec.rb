require_relative '../book'

describe Book do
  context 'It should create book' do
    title = 'Sing all Loud'
    author = 'Ricky Martin'
    book = Book.new(title, author)

    it 'should create an instance of class book' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'should check title and author of book' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end
  end
end
