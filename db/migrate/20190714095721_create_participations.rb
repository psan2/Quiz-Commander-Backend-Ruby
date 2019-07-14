class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :team_id
      t.integer :quiznight_id
      t.integer :score

      t.timestamps
    end
  end
end
