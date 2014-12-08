class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name
      t.integer :question_id
      t.text :answer
      t.timestamps
    end
  end
end
