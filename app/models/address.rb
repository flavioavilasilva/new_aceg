class Address < ApplicationRecord
  belongs_to :ong
  belongs_to :user
end
