class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :host_id
      t.string :nickname
      t.boolean :public

      t.timestamps
    end
  end
end
