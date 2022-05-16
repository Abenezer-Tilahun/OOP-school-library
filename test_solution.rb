require_relative './student'
require_relative './teacher'
person = Student.new(18, 'A', 'Abenezer', parent_permission: false)
puts(person.can_use_services?)
puts(person.name)
puts(person.name = ('Abeni'))
puts(person.name)
puts(person.age = (18))
puts(person.can_use_services?)
puts(person.play_hooky)

teacher = Teacher.new(28, 'A', 'Abenezer', parent_permission: true)
puts(teacher.can_use_services?)
