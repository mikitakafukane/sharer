class Event < ApplicationRecord
  
  validates :title, presence: true
  
  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end
  
end
