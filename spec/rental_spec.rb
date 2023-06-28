# Install the 'rspec' gem if you haven't already
# Run the tests using the 'rspec' command in your terminal

# rental_spec.rb
require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:date) { '2023-06-28' }
  subject(:rental) { Rental.new(date, book, person) }

  describe '#date' do
    it 'returns the rental date' do
      expect(rental.date).to eq(date)
    end
  end

  describe '#book' do
    it 'returns the rented book' do
      expect(rental.book).to eq(book)
    end
  end

  describe '#person' do
    it 'returns the person who rented the book' do
      expect(rental.person).to eq(person)
    end
  end
end
