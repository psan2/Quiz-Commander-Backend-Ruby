class CreateQuizRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_rounds do |t|
      t.references :quiz, foreign_key: true
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
