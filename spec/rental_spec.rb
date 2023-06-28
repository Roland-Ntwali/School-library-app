require_relative '../app'  # Add this line if necessary
require_relative '../rental'  # Add this line to load the Rental class
require_relative '../book'  # Add this line to load the Book class
require_relative '../person'  # Add this line to load the Person class

describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:date) { '2023-06-28' }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'creates a new rental with the specified date, book, and person' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book rentals list' do
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person rentals list' do
      expect(person.rentals).to include(rental)
    end
  end
end
