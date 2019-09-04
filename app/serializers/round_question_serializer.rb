class RoundQuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :round_id, :question_id, :index_in_round
end
