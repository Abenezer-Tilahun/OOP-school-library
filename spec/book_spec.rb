require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Title'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'Author'
    end
  end

  it 'book rentals to be empty' do
    expect(@book.rentals).to eql []
  end

  it 'add a rental' do
    @student = Student.new('26', 'vab')
    expect(@book.rentals.length).to eql(0)
    @book.add_rental('2022-03-26', @student)
    expect(@book.rentals.length).to eql(1)
  end
end
