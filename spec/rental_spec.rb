require_relative 'spec_helper'

describe Rental do
  context 'testing the rental class' do
    title = 'book1'
    author = 'author1'
    book = Book.new(title, author)

    age = 10
    name = 'person name'
    person = Person.new(age, name)

    date = '27/05/22'
    rental = Rental.new(date, book, person)

    it 'validate the date' do
      expect(rental.date).to eq date
    end

    it 'validate the book' do
      expect(rental.book.title).to eq title
    end

    it 'validate the book author' do
      expect(rental.book.author).to eq author
    end

    it 'validate the person age' do
      expect(rental.person.age).to eq age
    end

    it 'validate the person name' do
      expect(rental.person.name).to eq name
    end
  end
end
