require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Football', 50, 'Pep')
  end

  describe 'test initialize' do
    it 'should display age, specialization, and name' do
      expect(@teacher).to be_an_instance_of Teacher
    end
    it 'should return teacher name' do
      expect(@teacher.name).to eq 'Pep'
    end
    it 'should return teacher age' do
      expect(@teacher.age).to eq 50
    end
    it 'should return teacher specialization' do
      expect(@teacher.instance_variable_get(:@specialization)).to eq 'Football'
    end
  end

  describe 'test if teacher can use services' do
    it 'should return true' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end
end
