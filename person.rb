require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
    return true if age >= 18

    false
  end
end
