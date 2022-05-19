require_relative './person'
require_relative './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom = 'Default', name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = Classroom.new(classroom)
    check = -> { @classroom.students.push(self) unless @classroom.students.include?(self) }
    check.call
  end

  def classroom=(classroom)
    @classroom = Classroom.new(classroom)
    check.call
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
