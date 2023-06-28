require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

RSpec.describe Person do
  describe '#can_use_services?' do
    it 'returns true for a person of age 20 with parent permission' do
      person = Person.new(20, 'John Doe', parent_permission: true)
      expect(person.can_use_services?).to be true
    end

    it 'returns true for a person of age 17 with parent permission' do
      person = Person.new(17, 'Jane Smith', parent_permission: true)
      expect(person.can_use_services?).to be true
    end

    it 'returns false for a person of age 17 without parent permission' do
      person = Person.new(17, 'Alice Brown', parent_permission: false)
      expect(person.can_use_services?).to be false
    end

    it 'returns true for a person of age 19 without parent permission' do
      person = Person.new(19, 'Bob Johnson', parent_permission: false)
      expect(person.can_use_services?).to be true
    end
  end

  describe '#correct_name' do
    it 'returns the correct name of the person' do
      person = Person.new(30, 'mary smith', parent_permission: false)
      expect(person.correct_name).to eq('mary smith')
    end
  end

  describe 'decorators' do
    it 'capitalizes the person name' do
      person = Person.new(30, 'mary smith', parent_permission: false)
      decorated_person = CapitalizeDecorator.new(person)
      expect(decorated_person.correct_name).to eq('Mary smith')
    end

    it 'trims the person name' do
      person = Person.new(30, 'john doe the third', parent_permission: false)
      decorated_person = TrimmerDecorator.new(person)
      expect(decorated_person.correct_name).to eq('john doe t')
    end
  end
end
