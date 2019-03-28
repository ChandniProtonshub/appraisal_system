class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :description
      t.integer :question_type_id
      t.timestamps
    end
  end
end
