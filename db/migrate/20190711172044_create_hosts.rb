class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :username
      t.text :password_digest

      t.timestamps
    end
  end
end
