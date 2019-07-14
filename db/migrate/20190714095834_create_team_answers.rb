class CreateTeamAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_answers do |t|
      t.integer :answer_id
      t.integer :participation_id

      t.timestamps
    end
  end
end
