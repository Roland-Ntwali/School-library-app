require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable_obj.correct_name[0..9] unless super.length <= 10

    super
  end
end
