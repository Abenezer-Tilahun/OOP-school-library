require './rental'
require './book_store'
require './person_list'
require './data'
require 'json'
class Rentalsore
  attr_accessor :rentals, :people, :books

  def initialize(books, person)
    @books = books
    @people = person
    @rentals = JSON.parse(File.read('./Data/rental_file.json'))
  end

  def rentalslist
    puts 'No rentals has been made at the moment' if JSON.parse(File.read('./Data/rental_file.json')).empty?
    print 'To view your rental records, type your ID: '
    id = gets.chomp.to_i
    rental = JSON.parse(File.read('./Data/rental_file.json')).select { |rend| rend['id'] == id }
    if rental.empty?
      puts 'No records exist for that ID'
    else
      puts 'Your rental records are the following: '
      puts ''
      rental.each_with_index do |record, index|
        puts ''
        print "#{index + 1}| Date: #{record['date']} | Borrower: #{record['borrower']}"
        print " Borrowed book: \"#{record['book']}\" by #{record['author']}"
        puts ''
      end
    end
  end

  def create_rental
    if @books.empty? && @people.empty?
      puts 'There are no books and people in the system'
    else
      puts 'Please press the number corresponding to the book that you want: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Book Title: \"#{book.title}\" | Author: #{book.author}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'PLease type your ID: '
      @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
      identity = gets.chomp.to_i

      individual = @people.select { |person| person.id == identity }.first

      print 'Enter the date[yyyy-mm-dd]: '
      date = gets.chomp.to_s

      rent = Rental.new(date, @books[index], individual)
      temp = {
        date: rent.date,
        id: individual.id,
        borrower: individual.name,
        book: @books[index].title,
        author: @books[index].author
      }

      @rentals << temp
      File.write('./Data/rental_file.json', JSON.generate(@rentals))
      puts 'The book has been rented successfully'
    end
  end
end
