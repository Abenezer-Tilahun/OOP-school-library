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
    # rental = Rental.new(date, self, person)
    # @rentals.push(rental)
    @rentals.push(Rental.new(date, self, person)) unless @rentals.include?(Rental.new(date, self, person))
  end

  def to_json(*_args)
    {
      'json_class' => self.class.name,
      'title' => @title,
      'author' => @author
    }
  end
end
