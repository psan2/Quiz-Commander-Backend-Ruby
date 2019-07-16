class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :host_id
      t.string :nickname
      t.string :round_type

      t.timestamps
    end
  end
end
