class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :creater,   foreign_key: true
      t.references :performer, foreign_key: true
      t.string     :title,     null: false
      t.string     :description
      t.datetime   :end_date
      
      t.timestamps
    end
  end
end
