class Quiz < ApplicationRecord
  belongs_to :host
  has_many :quiz_nights

end
