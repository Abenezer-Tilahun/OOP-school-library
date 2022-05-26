require_relative '../teacher'
require_relative '../person'

describe Teacher do 
    context 'When testing the teacher class' do
        age= 27
        name='Teacher'
        specialization='Ruby'
        teacher=Teacher.new(age,specialization,name)
    
it 'should validate the age of the teacher' do
    expect(teacher.age).to eq age
end

it 'should validate the specialization of the teacher' do
    expect(teacher.specialization).to eq specialization
end

it 'should validate the name of the teacher' do
    expect(teacher.name).to eq name
end

end
end
