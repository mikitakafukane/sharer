class Task < ApplicationRecord
  
  belongs_to :creater,   class_name: 'User', foreign_key: 'creater_id', optional: true
  belongs_to :performer, class_name: 'User', foreign_key: 'performer_id'
end
