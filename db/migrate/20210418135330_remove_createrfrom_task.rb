class RemoveCreaterfromTask < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tasks, :creater, foreign_key: true
    remove_reference :tasks, :performer, foreign_key: true
    
  end
end
