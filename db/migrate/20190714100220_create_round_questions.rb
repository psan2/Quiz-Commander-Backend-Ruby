class CreateRoundQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :round_questions do |t|
      t.integer :round_id
      t.integer :question_id
      t.integer :index_in_round

      t.timestamps
    end
  end
end
