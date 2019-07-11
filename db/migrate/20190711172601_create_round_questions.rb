class CreateRoundQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :round_questions do |t|
      t.references :round, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
