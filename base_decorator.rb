require 'nameable'

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initilize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
