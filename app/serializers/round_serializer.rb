class RoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nickname
  has_many :round_questions
  has_many :questions, through: :round_questions
end
