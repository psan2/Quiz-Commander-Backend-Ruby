class QuizRoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quiz_id, :round_id, :index_in_quiz
end
