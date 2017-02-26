class Room < ActiveRecord::Base
  has_many :room_categories
  
  has_many :categories,through: :room_categories
  
  has_attached_file :image, :styles => {large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  has_attached_file :image2, :styles => {large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  has_attached_file :image3, :styles => {large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  #geocode lines
  geocoded_by :address
  after_validation :geocode,  if: ->(obj){ obj.address.present? and obj.address_changed? }
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\z/
  belongs_to :user
  validate :thing_count_within_limit, :on => :create

  def thing_count_within_limit
    if self.user.rooms.count >= 2
      errors.add(:base, "포스팅 갯수가 2개 이상은 불가능합니다.")
    end
  end
  
  validates :address, presence: true, length: {minimum: 3, maximum: 100}
  validates :description, presence: true, length: {minimum: 5, maximum: 300}
  validates :image, presence: true
  validates_attachment_size :image, :in => 0.megabytes..20.megabytes
  validates :image2, presence: true
  validates_attachment_size :image2, :in => 0.megabytes..20.megabytes
  validates :image3, presence: true
  validates_attachment_size :image3, :in => 0.megabytes..20.megabytes
  validates :gender, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :start_date, presence: true
  validates :room_private, presence: true
  validates :room_type, presence: true
  validates :price, presence: true
  
  
end