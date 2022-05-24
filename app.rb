require './book_store'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './person_list'
require './rental_store'
class App
  def initialize
    @books = Bookstore.new
    @people = Personlist.new
    @rentals = Rentalsore.new(@books.books, @people.people)
  end

  def start
    selection
  end

  def list_selections
    puts ' '
    puts "Please choose an option by selecting a number:
                1. List all books
                2. List all people
                3. Create person account
                4. Create a book
                5. Create a rental
                6. List all rentals for a given person ID
                7. Exit"
    gets.chomp
  end

  def selection
    case list_selections
    when '1'
      @books.booklist
    when '2'
      @people.peoplelist
    when '3'
      @people.create_person
    when '4'
      @books.create_book
    when '5'
      @rentals.create_rental
    when '6'
      @rentals.rentalslist
    when '7'
      puts 'Thank you for using the app. Goodbye!'
      exit
    else
      puts 'Invalid input. Try again'
    end
    selection
  end
end
