require_relative '../person'
require_relative '../trimmer_decorator'

# Test TrimmerDecorator
def test_trimmer_decorator
  # Create a person
  person = Person.new(25, 'John Doe')

  # Create a TrimmerDecorator
  decorator = TrimmerDecorator.new(person)

  # Test correct_name with a long name
  long_name = 'This is a very long name'
  person.name = long_name
  expected_trimmed_name = long_name[0..9]
  trimmed_name = decorator.correct_name
  assert(trimmed_name == expected_trimmed_name, "Failed to trim long name: #{trimmed_name}")

  # Test correct_name with a short name
  short_name = 'Short'
  person.name = short_name
  expected_trimmed_name = short_name
  trimmed_name = decorator.correct_name
  assert(trimmed_name == expected_trimmed_name, "Failed to keep short name as is: #{trimmed_name}")
end

# Assert helper method
def assert(condition, message)
  if condition
    puts 'Pass'
  else
    puts "Fail: #{message}"
  end
end

# Run the test
test_trimmer_decorator
