class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :host, foreign_key: true
      t.string :nickname
      t.boolean :public

      t.timestamps
    end
  end
end
