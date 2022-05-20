require_relative './nameable'
require_relative './rental'

# Person class
class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  # Public method
  def can_use_services?
    return true if @parent_permission || of_age?

    false
  end

  def correct_name
    @name
  end

  # private methods

  private

  def of_age?
    age >= 18
  end
end
