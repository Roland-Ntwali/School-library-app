require_relative 'person'

class Teacher < Person
  # constructor
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # public method
  def can_use_services?
    true
  end
end
