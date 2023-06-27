require_relative '../book'

describe Book do
  context 'When testing the Book class' do
    book = Book.new('Ruby', 'Jose')

    it 'should create an instance of Book' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'should have the correct title' do
      expect(book.title).to eq('Ruby')
    end

    it 'should have the correct author' do
      expect(book.author).to eq('Jose')
    end
  end
end
