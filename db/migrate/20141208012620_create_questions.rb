class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :questionnaire_id
      t.string :name
      t.text :label
      t.timestamps
    end
  end
end
