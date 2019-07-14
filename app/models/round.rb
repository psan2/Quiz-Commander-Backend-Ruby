class Round < ApplicationRecord
  belongs_to :host
  has_many :quiz_rounds

end
