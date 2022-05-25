require 'json'
require './student'
require './teacher'
require './rental'
def initialize_files
  File.write('./Data/book_file.json', []) unless File.exist?('./Data/book_file.json')
  File.write('./Data/people_file.json', []) unless File.exist?('./Data/people_file.json')
  File.write('./Data/rental_file.json', []) unless File.exist?('./Data/rental_file.json')
end

def read_books
  books = []
  JSON.parse(File.read('./Data/book_file.json')).each do |book|
    books.push(Book.new(book['title'], book['author']))
  end
  books
end

def write_books(books)
  temp = []
  books.each do |book|
    temp.push({
                title: book.title,
                author: book.author
              })
  end

  File.write('./Data/book_file.json', JSON.generate(temp).to_s)
end
