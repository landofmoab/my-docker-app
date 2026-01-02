class MakeUserFieldsOptional < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :birthdate, true
    change_column_null :users, :current_city, true
    change_column_null :users, :education, true
    change_column_null :users, :height, true
    change_column_null :users, :home_city, true
    change_column_null :users, :gender, true
  end
end
