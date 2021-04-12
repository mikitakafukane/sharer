class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :visitor, foreign_key: true
      t.references :visited, foreign_key: true
      t.references :task,    foreign_key: true
      t.references :post,    foreign_key: true
      t.references :comment, foreign_key: true
      t.references :like,    foreign_key: true
      t.references :chat,    foreign_key: true
      t.references :room,    foreign_key: true
      
      t.string  :action,  null: false, default: ''
      t.boolean :checked, null: false, default: false
      
      t.timestamps
    end
  end
end
