class Event < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  def start_time
    start_date
  end

  def end_time
    end_date
  end
end
