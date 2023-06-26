require_relative '../book'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../app'
require 'json'

def load_books
  return unless File.exist?('./data/books.json')

  file = File.open('./data/books.json')

  if file.empty?
    'Please add some books.'
  else
    books = JSON.parse(File.read('./data/books.json'))

    books.each do |book|
      book = Book.new(book['title'], book['author'])
      @books << book
    end
  end
  file.close
end

def save_book(title, author)
  obj = {
    title: title,
    author: author
  }

  return unless File.exist?('./data/books.json')

  file = File.open('./data/books.json')

  if file.empty?
    book = [obj]
  else
    book = JSON.parse(File.read('./data/books.json'))
    book << obj
  end

  file.close

  myfile = File.open('./data/books.json', 'w')
  myfile.write(JSON.pretty_generate(book))
  myfile.close
end
