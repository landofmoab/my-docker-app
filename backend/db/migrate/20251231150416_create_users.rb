class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :gender, null: false, default: "male"
      t.date :birthdate, null: false
      t.string :home_city, null: false
      t.string :current_city, null: false
      t.integer :height, null: false
      t.integer :education, null: false

      t.timestamps
    end
  end
end
