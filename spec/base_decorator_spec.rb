require_relative '../nameable'
require_relative '../base_decorator'

RSpec.describe BaseDecorator do
  let(:nameable_obj) { double('nameable_obj') }
  let(:decorator) { described_class.new(nameable_obj) }

  describe '#initialize' do
    it 'sets the nameable_obj attribute' do
      expect(decorator.nameable_obj).to eq nameable_obj
    end
  end

  describe '#correct_name' do
    it 'calls the correct_name method on the nameable_obj' do
      expect(nameable_obj).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
