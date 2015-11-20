class Question < ActiveRecord::Base
  has_many :answers
  has_many :questions_options

  def correct_answer
      questions_options.select { |a| a.correct == 1 }.first
  end

end