require './student'

describe Student do
    context 'When testing the person class' do
        name = 'v'
        age = 29
        student = Student.new(age,name)

        it 'validate the age of student' do
            expect(student.age).to eq age
        end

        it 'validate the name of student' do
            expect(student.name).to eq 'v'
        end
        
    end

end

