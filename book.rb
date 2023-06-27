require_relative 'rental'

class Book
  # setters & getters
  attr_accessor :title, :author, :rentals, :id

  # constructor
  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  # add rental method
  def rent(date, person)
    Rental.new(date, self, person)
  end
end
