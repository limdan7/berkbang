class Room < ActiveRecord::Base
  has_many :room_categories
  has_many :categories,through: :room_categories
  has_attached_file :image, :styles => {large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  #geocode lines
  geocoded_by :full_street_address
  after_validation :geocode
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  
  validates :address, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 300}
end