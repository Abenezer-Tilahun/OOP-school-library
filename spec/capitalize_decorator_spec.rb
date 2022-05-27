require_relative 'spec_helper'

describe CapitalizeDecorator do
  context 'When testing the Basedecorator class' do
    it 'should return \'abenezer\' when we call the correct_name method' do
      person = Person.new(27, 'abenezer')
      cap_decorator = CapitalizeDecorator.new(person)
      name = cap_decorator.correct_name
      expect(name).to eq 'Abenezer'
    end
  end
end
