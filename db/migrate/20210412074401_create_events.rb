class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user,       foreign_key: true
      t.string     :title,      null: false
      t.string     :description
      t.datetime   :start_date
      t.datetime   :end_date
      
      t.timestamps
    end
  end
end
