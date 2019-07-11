class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.references :host, foreign_key: true
      t.integer :index

      t.timestamps
    end
  end
end
