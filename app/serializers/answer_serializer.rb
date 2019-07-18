class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :question_id, :answer_content, :correct_answer
end
