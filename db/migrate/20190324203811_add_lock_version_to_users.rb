class AddLockVersionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lock_version, :integer, default: 0
  end
end
