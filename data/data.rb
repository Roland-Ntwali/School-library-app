require_relative '../book'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../app'
require 'json'

def load_books
  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      'If this is your first time using our app, kindly add some books first.'
    else
      books = JSON.parse(File.read('./data/books.json'))

      books.each do |book|
        book = Book.new(book['title'], book['author'])
        @books << book
      end
    end
    file.close
  end
end

def save_book(title, author)
  obj = {
    title: title,
    author: author
  }

  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
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
end

def load_people
  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')
    if File.empty?('./data/people.json')
      puts 'Please add people data if this is your first time visiting our app'
    else
      people = JSON.parse(File.read('./data/people.json'))
      people.each do |person|
        if person['option'] == 'Student'
          student = Student.new(person['age'], person['name'])
          @people << student
        else
          teacher = Teacher.new(person['specialization'], person['age'], person['name'])
          @people << teacher
        end
      end
    end
    file.close
  else
    puts 'Please insert some data'
  end
end
