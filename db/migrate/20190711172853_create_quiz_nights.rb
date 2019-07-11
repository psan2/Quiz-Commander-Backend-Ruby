class CreateQuizNights < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_nights do |t|
      t.references :quiz, foreign_key: true
      t.date :date
      t.string :location
      t.integer :winner_id

      t.timestamps
    end
  end
end
