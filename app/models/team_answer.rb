class TeamAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :quiznight
  belongs_to :participation
  belongs_to :answer
end
