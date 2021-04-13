class RenameBelongingsColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :belongings, :belonging
  end
end
