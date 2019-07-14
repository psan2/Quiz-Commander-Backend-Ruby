class TeamAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :participation

  belongs_to :team, through: :participation
  
end
