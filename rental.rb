class Rental
  # setters & getters
  attr_reader :book, :parent_permission
  attr_accessor :date

  # constructor
  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end
