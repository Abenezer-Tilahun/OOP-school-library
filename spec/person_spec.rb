require 'spec_helper'

describe Person do
  context 'When testing the person class' do
    age = 25
    name = 'person'
    person = Person.new(age, name)

    it 'should validate the age of the person' do
      expect(person.age).to eq age
    end

    it 'should validate the name of the person' do
      expect(person.name).to eq name
    end

    it 'should return true when we call the can_use_services? method' do
      expect(person.can_use_services?).to eq true
    end

    it 'should return true when we call the can_use_services? method for a student who\'s age is greater than 18 and doesn\'t have his parent\'s permission' do
      new_student = Person.new(18, name, parent_permission: false)
      expect(new_student.can_use_services?).to eq true
    end

    it 'should return false when we call the can_use_services? method for a person who\'s age is less than 18 and doesn\'t have his parent\'s permission' do
      new_student = Person.new(13, name, parent_permission: true)
      expect(new_student.can_use_services?).to eq true
    end

    it 'should return true when we call the can_use_services? method for a person who\'s age is less than 18 and has their parent\'s permission' do
      new_student = Person.new(17, name, parent_permission: true)
      expect(new_student.can_use_services?).to eq true
    end
  end
end
