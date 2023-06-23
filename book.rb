require_relative 'rental'

class Book
  # setters & getters
  attr_accessor :title, :author, :rentals

  # constructor
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # add rental method
  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
