class Gallery < ApplicationRecord
  belongs_to :ong
  has_many :photos
end
