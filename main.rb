require_relative './app'
class Main
  def self.home_page
    puts 'Welcome to School Library App!'
    puts 'Please Choose an Option By Entering a number: '
    @content = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person ',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
    @content.each { |index, string| puts "#{index} - #{string}" }
    Integer(gets.chomp)
  end
  app = App.new
  loop do
    case home_page
    when 1
      app.booklist
    when 2
      app.peoplelist
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.rentalslist
    when 7
      puts 'Thank You For using School Library App!'
      exit
    else
      puts 'Out of Range Input!'
    end
  end
end

def main
  App.new
end

Main
