require 'spec_helper'

describe Classroom do
  context 'When testing the classroom class' do
    classroom_label = 'ruby'
    classroom = Classroom.new('ruby')

    it 'should validate the label' do
      expect(classroom_label).to eq classroom.label
    end
  end
end
