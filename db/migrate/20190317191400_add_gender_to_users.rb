class AddGenderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
  # add_column :table_name, :field_name, :field_type
  end
end
