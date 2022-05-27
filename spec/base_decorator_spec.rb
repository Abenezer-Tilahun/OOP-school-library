require_relative 'spec_helper'

describe BaseDecorator do
    context 'When testing the Basedecorator class' do
        it 'should return \'abenezer\' when we call the correct_name method' do
            person=Person.new(27, 'abenezer')
            base_decorator=BaseDecorator.new(person)
            name=base_decorator.correct_name 
            expect(name).to eq 'abenezer'
        end    
end
end