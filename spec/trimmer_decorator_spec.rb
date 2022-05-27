require_relative 'spec_helper'

describe TrimmerDecorator do
  context 'When testing the TrimmerDecorator class' do
    it 'should return \'abenezervi\' when we call the correct_name method' do
      person = Person.new(27, 'abenezervignesh')
      trim_decorator = TrimmerDecorator.new(person)
      name = trim_decorator.correct_name
      expect(name).to eq 'abenezervi'
    end
  end
end
