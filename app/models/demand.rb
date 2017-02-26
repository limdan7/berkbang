class Demand < ActiveRecord::Base
  belongs_to :users
  
  validates :description, presence: true, length: {minimum: 5, maximum: 300}
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :start_date, presence: true
  validates :room_private, presence: true
  validates :price, presence: true
  
end
