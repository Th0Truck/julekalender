class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :answer, :question_id, :user_id, :correct

end
