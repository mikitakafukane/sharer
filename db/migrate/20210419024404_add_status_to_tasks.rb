class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :string
    add_reference :tasks, :user, foreign_key: true
  end
end
