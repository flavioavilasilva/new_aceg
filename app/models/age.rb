class Age < ApplicationRecord
  belongs_to :pet

  validates :age, :scala, presence: true
end
