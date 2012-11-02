class QuestionsOption < ActiveRecord::Base
  belongs_to :question
  attr_accessible :label, :question_id, :correct
end
