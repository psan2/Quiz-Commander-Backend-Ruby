class QuizSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nickname
  has_many :quiz_rounds
  has_many :rounds, through: :quiz_rounds
end
