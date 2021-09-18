class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.float :fasting, null: false
      t.float :after_meal, null: false
      t.float :bp, null: false
      t.string :user_email, foreign_key: true
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
