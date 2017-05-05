class Photo < ApplicationRecord
  belongs_to :pet

  has_attached_file :image, styles: { mini: "200X200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
