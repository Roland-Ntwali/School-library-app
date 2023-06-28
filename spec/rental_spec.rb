# Import the required files
require_relative '../book'
require_relative '../person'
require_relative '../rental'

# Create a book
book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')

# Create a person
person = Person.new(25, 'John Doe')

# Create a rental
date = '2023-06-28'
rental = Rental.new(date, book, person)

# Verify the rental properties
puts "Date: #{rental.date}"
puts "Book: #{rental.book.title} by #{rental.book.author}"
puts "Person: #{rental.person.name}, Age: #{rental.person.age}"

# Access rentals from book and person objects
puts "Rentals of the book: #{book.rentals.map(&:date)}"
puts "Rentals of the person: #{person.rentals.map(&:date)}"
