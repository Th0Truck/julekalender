class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :header
      t.text :question

      t.timestamps
    end
  end
end
