class CreateQuizRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_rounds do |t|
      t.integer :quiz_id
      t.integer :round_id
      t.integer :index_in_quiz

      t.timestamps
    end
  end
end
