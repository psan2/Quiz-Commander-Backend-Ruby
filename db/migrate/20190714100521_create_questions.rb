class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :host_id
      t.string :type
      t.text :question_content
      t.string :aux_content_url
      t.string :nickname

      t.timestamps
    end
  end
end
