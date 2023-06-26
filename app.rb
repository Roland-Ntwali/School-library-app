require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @cmd = {
      '1': 'List all books',
      '2': 'List all people',
      '3': 'Create a person',
      '4': 'Creat a book',
      '5': 'Create a rental',
      '6': 'List all rentals for a given person id',
      '7': 'Exit'
    }

    @books = []

    @people = []
  end

  def display_cmd
    @cmd.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def list_all_books
    if @books.empty?
      puts 'Please insert books first!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'Please insert people first!'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_all_person_with_numbers
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

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

    @people.push(Student.new('11', age, name, parent_permission: parent_permission))
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people.push(Teacher.new(specialization, age, name))
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    case gets.chomp
    when '1'
      create_student

    when '2'
      create_teacher
    end

    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts 'Book created successfully'
  end

  def create_rental()
    puts 'Select a book from the following list by number: '
    list_all_books
    book_option = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by number (not id): '
    list_all_person_with_numbers
    person_option = gets.chomp.to_i
    puts

    print 'Date: '
    date = gets.chomp

    Rental.new(date, @books[book_option], @people[person_option])

    puts 'Rental created successfully'
  end

  def rentals_of_person()
    print 'Id of person: '
    id = gets.chomp.to_i
    person_arr = @people.select { |person| person.id == id }

    if person_arr.empty?
      puts 'No person matches the given ID!'
    else
      person_arr[0].rentals.each do |rental|
        puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def choose_option(input)
    case input
    when '1' then list_all_books
    when '2' then list_all_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then rentals_of_person
    end
  end

  def user_option_executer
    input = gets.chomp

    if input == '7'
      exit
    else
      choose_option(input)
    end
  end

  def run
    puts 'Please choose an option by entering a number: '
    display_cmd
    user_option_executer
  end
end
