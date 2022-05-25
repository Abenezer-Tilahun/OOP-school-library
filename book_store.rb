require './book'
require './data'
require 'json'
class Bookstore
  attr_accessor :books

  def initialize
    @books = read_books
  end

  def booklist
    puts '*' * 70
    puts 'No book found!' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
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
    write_books(@books)
    puts 'Book created successfully'
    puts '*' * 70
  end
end
