require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def booklist
    puts '*' * 70
    puts 'No book found!' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts '*' * 70
  end

  def peoplelist
    puts '*' * 70
    puts 'No one found!' if @people.empty?
    @people.each { |person| puts "[#{person.class}], Name: #{person.name}, Age: #{person.age}, Id: #{person.id}" }
    puts '*' * 70
  end

  def create_person
    puts '*' * 70
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'invalid input'
    end
    puts '*' * 70
  end

  def create_teacher
    puts '*' * 70
    print 'teacher age: '
    age = gets.chomp
    print 'teacher specialization: '
    specialization = gets.chomp
    print 'teacher name: '
    name = gets.chomp
    teacher = Teacher.new(age, specialization, name, parent_permission: true)
    puts 'Teacher created successfully'
    @people.push(teacher)
    puts '*' * 70
  end

  def create_student
    puts '*' * 70
    print 'student age: '
    age = gets.chomp
    print 'student name: '
    name = gets.chomp
    print 'has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      @people.push(student)
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @people.push(student)
    end
    puts 'Student created successfully'
    puts '*' * 70
  end

  def create_book
    puts '*' * 70
    print 'book title: '
    title = gets.chomp
    print 'book author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    puts '*' * 70
  end

  def create_rental
    puts '*' * 70
    if @books.size.zero?
      puts 'No Books Available'
    elsif @people.size.zero?
      puts 'No Person Available'
    else
      puts 'select the book by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      selected_book = gets.chomp.to_i

      puts 'select a person by number'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      selected_person = gets.chomp.to_i

      puts 'Enter date [YYYY-MM-DD]'
      date = gets.chomp.to_s
      rental_item = Rental.new(date, @books[selected_book], @people[selected_person])
      @rentals.push(rental_item)
      puts 'Rental created successfully'
    end
    puts '*' * 70
  end

  def rentalslist
    puts '*' * 70
    puts 'Enter a person id: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.to_i == id.to_i
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts 'Person has no rentals yet'
      end
      puts '*' * 70
    end
  end
end
