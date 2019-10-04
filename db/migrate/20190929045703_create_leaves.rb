class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.date :from_date
      t.date :to_date
      t.text :reason
      t.integer :user_id
      t.integer :reporting_head_id
      t.string :status

      t.timestamps
    end
  end
end
