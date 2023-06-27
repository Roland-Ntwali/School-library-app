require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'data/loaddata'

class App
  def initialize
    @books = LoadData.load_books

    @people = LoadData.load_people

    @rentals = LoadData.load_rentals
  end

  # print out all books
  def list_all_books
    if @books.empty?
      puts 'Please insert books first!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}}"
      end
    end
  end

  # print out all people
  def list_all_people
    if @people.empty?
      puts 'Please insert people first!'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_all_people_with_index
    @people.each_with_index do |person, index|
      puts "#{index}. [#{person.class}] Name: #{person.name}, ID #{person.id}, Age: #{person.age}"
    end
  end

  # create a student
  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent persmission? [Y/N]:'
    permission = gets.chomp.downcase
    case permission
    when 'y' then parent_permission = true
    when 'n' then parent_permission = false
    end

    # create a student and push it to people array
    @people.push(Student.new('11', age, name, parent_permission: parent_permission))
  end

  # create a teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    # create a teacher and push it to people array
    @people.push(Teacher.new(specialization, age, name))
  end

  # create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    case gets.chomp
    when '1'
      create_student

    when '2'
      create_teacher
    end

    # success message
    puts 'Person created successfully'
  end

  # create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    # create the book object and add it to the books list
    @books.push(Book.new(title, author))
    # success message
    puts 'Book created successfully'
  end

  # create a rental
  def create_rental()
    puts 'Select a book from the list by number'
    list_all_books
    book_option = gets.chomp.to_i
    puts

    puts 'Select a book from the following list by number: '
    list_all_people_with_index
    person_option = gets.chomp.to_i
    puts

    # select date
    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_option], @people[person_option]))

    # success message
    puts 'Rental Created Successfully'
  end

  # list all rentals for a given person id
  def rentals_of_person()
    puts 'All people in the system'
    list_all_people
    print 'Id of person: '
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }

    if person
      @rentals.each do |rental|
        puts "Date #{rental.date}, Book: #{rental.book.title} Author: #{rental.book.author}" if rental.person.id == id
      end
    else
      puts 'No person matches the given ID!'
    end
  end
end
