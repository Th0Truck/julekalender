class Question < ActiveRecord::Base
  has_many :answers
  has_many :questions_options
  attr_accessible :header, :question

  def self.correct_answer
      questions_options.where { |a| a.correct == 1 }
  end

end
