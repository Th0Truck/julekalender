class CreateQuestionsOptions < ActiveRecord::Migration
  def change
    create_table :questions_options do |t|
      t.integer :question_id
      t.string :label

      t.timestamps
    end
  end
end
