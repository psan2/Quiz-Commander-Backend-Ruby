class CreateQuizNights < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_nights do |t|
      t.integer :quiz_id
      t.date :date
      t.string :location
      t.integer :winning_team_id
      t.integer :pub_id

      t.timestamps
    end
  end
end
