class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :question_type,
             :question_content,
             :aux_content_url,
             :nickname,
             :updated_at
  has_many :answers
end
