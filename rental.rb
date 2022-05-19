class Rental
  attr_accessor :date, :book, :person

  # rubocop:disable Style/ClassVars
  @@rentals = []
  # rubocop:enable Style/ClassVars

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
    @@rentals.push(self)
  end
end
