class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :answer_content, :correct_answer
end
