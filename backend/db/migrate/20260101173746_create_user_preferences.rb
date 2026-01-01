class CreateUserPreferences < ActiveRecord::Migration[8.1]
  def change
    create_table :user_preferences do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.integer :preferred_age_min, null: false
      t.integer :preferred_age_max, null: false
      t.string :preferred_gender, null: false

      t.timestamps
    end
  end
end
