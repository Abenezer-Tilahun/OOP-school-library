require './person'
class Personlist
  attr_accessor :people

  def initialize
    @people = []
  end

  def peoplelist
    puts '*' * 70
    puts 'No one found!' if @people.empty?
    @people.each { |person| puts "[#{person.class}], Name: #{person.name}, Age: #{person.age}, Id: #{person.id}" }
    puts '*' * 70
  end

  def create_person
    puts '*' * 70
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'invalid input'
    end
    puts '*' * 70
  end

  def create_teacher
    puts '*' * 70
    print 'teacher name: '
    name = gets.chomp
    print 'teacher age: '
    age = gets.chomp
    print 'teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name, parent_permission: true)
    puts 'Teacher created successfully'
    @people.push(teacher)
    puts '*' * 70
  end

  def create_student
    puts '*' * 70
    print 'student age: '
    age = gets.chomp
    print 'student name: '
    name = gets.chomp
    print 'has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      @people.push(student)
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @people.push(student)
    end
    puts 'Student created successfully'
    puts '*' * 70
  end
end
