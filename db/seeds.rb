# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Seeding...'

#USUÁRIO DE DEMONSTRAÇÃO , SEM ONG A SER DEMONSTRADA
user = FactoryGirl.create(:user, email: 'teste@adopet.com.br',
                                 password: '123456')

#VAI CRIAR MAIS 3 USUÁRIOS E SUAS RESPECTIVAS ONGS E PETS
users = FactoryGirl.create_list(:user, 3)
users.each do |user|
  FactoryGirl.create(:ong, user: user)
end

FactoryGirl.create(:pet, ong: Ong.first, name: 'Papa', pet_type: 'Gato',
                    avatar: File.new("#{Rails.root}/spec/support/fixtures/pets/3.jpg"),
                    age: 3, castrated: true, gender: 'Fêmea' )

#CRIANDO PETS PARA AS ONGS, E A IMAGEM RANDOMICAMENTE
Ong.all.each do |ong|

  (1..Random.rand(1..10)).each do |n|
    random = Random.rand(1..10)
    FactoryGirl.create(:pet, ong: ong, pet_type: random % 2 == 0 ? 'Cachorro' : 'Gato',
    avatar: File.new("#{Rails.root}/spec/support/fixtures/pets/#{random}.jpg"))
  end

end

#CRIANDO 2 EVENTOS PARA DEMONSTRAÇÃO
FactoryGirl.create(:event, ong: Ong.find(2), datetime: 10.days.from_now)
FactoryGirl.create(:event, ong: Ong.find(1), datetime: 50.days.from_now)


puts 'Finished seeds'
