class RoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :round_type, :nickname
  has_many :questions, through: :round_questions
end
