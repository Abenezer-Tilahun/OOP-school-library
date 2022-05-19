require_relative './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  # rubocop:disable Style/ClassVars
  @@books = []
  # rubocop:enable Style/ClassVars

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@books.push(self)
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end
end
