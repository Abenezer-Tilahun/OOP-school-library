require './person'

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
  end
end
