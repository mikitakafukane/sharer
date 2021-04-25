class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user,   foreign_key: true
      t.string     :title,     null: false
      t.string     :description
      t.string     :status
      
      t.timestamps
    end
  end
end
