class Classroom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    @student.push(student)
    student.classroom << self
  end
end
