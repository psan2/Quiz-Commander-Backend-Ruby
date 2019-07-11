class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :type
      t.text :question_content
      t.integer :answer_id
      t.references :host, foreign_key: true

      t.timestamps
    end
  end
end
