class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :team, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
