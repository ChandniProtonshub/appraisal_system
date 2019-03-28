class CreateQuestionsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_users do |t|
      t.integer  :question_id
      t.integer  :user_id
      t.timestamps
    end
  end
end
