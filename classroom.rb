class Classroom
  # setters & getters
  attr_accessor :label
  attr_reader :students

  # constructor
  def initialize(label)
    @label = label
    @students = []
  end

  # add student method
  def add_student(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end
end
