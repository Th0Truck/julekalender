class Question < ActiveRecord::Base
  has_many :answers
  has_many :questions_options
  attr_accessible :header, :question
end
