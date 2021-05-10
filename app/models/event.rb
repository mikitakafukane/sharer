class Event < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  
  def start_time
    start_date
  end

  def end_time
    end_date
  end
end
