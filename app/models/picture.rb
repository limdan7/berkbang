class Picture < ActiveRecord::Base

  belongs_to :room
  has_attached_file :image,:styles => {large: "600x600>", medium: "300x300>", thumb: "150x150#"},
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image

end