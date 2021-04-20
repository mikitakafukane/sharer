class AddLoginStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :end_date, :datetime
    remove_column :users, :is_deleted, :boolean
    change_column :users, :belonging, :string
  end
end
