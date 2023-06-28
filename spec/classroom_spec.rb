require_relative '../classroom'
describe Classroom do
  before :each do
    @classes = Classroom.new('classroom')
  end
  describe 'testing initialize for classroom' do
    it 'should display Classroom ' do
      expect(@classes).to be_an_instance_of Classroom
    end
    it 'classes has to be classroom' do
      expect(@classes.label).to eq 'classroom'
    end
  end
end
