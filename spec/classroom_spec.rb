require_relative '../classroom'
require_relative '../student'
require_relative '../person'

describe Classroom do
    context 'When testing the classroom class' do
        classroom_label = 'ruby'
        classroom = Classroom.new('ruby')
    end
    it 'should validate the label' do
        expect(classroom_label).to eq classroom.label
    end
end

