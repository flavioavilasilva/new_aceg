require 'rails_helper'

RSpec.describe :contract, type: :model do
  describe '#featured_pets' do
    it 'shows the first 3 pets of the ong' do
      ong = create(:ong)
      pet1 = create(:pet, ong: ong)
      pet2 = create(:pet, created_at: 3.days.ago, ong: ong)
      pet3 = create(:pet, created_at: 10.days.ago, ong: ong)
      pet4 = create(:pet, created_at: 2.days.ago, ong: ong)
      pet5 = create(:pet, ong: ong)

      pets = ong.featured_pets

      expect(pets.count).to be <= 3
      expect(pets).to include(pet4)
      expect(pets).to include(pet2)
      expect(pets).to include(pet3)
      expect(pets).to_not include(pet1)
      expect(pets).to_not include(pet5)
    end
  end
end
