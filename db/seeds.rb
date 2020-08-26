# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flat.destroy_all
User.destroy_all


user1 = User.create!(
    email: "airbnb@airbnb.com",
    password: "12345678"
)

Flat.create!(
  name: 'Stylish House Close to River Thames',
  address: 'Av. Fontes Pereira de Melo 16, Lisboa',
  description: 'Lovely warm comfortable and stylishly furnished house. Private bedroom and bathroom with shared living areas.',
  price: 65,
  photo: "https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  user_id: user1.id
)
Flat.create!(
  name: 'St Pancras Clock Tower Guest Suite',
  address: 'LX factory Lisbon',
  description: 'A mini apartment within the clock tower apartment at St Pancras Station, with its own en suite bathroom and kitchen and sitting area.',
  price: 110,
  photo: "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
  user_id: user1.id
)
Flat.create!(
  name: 'Jakes Home',
  address: 'Rua do Conde de Redondo 91B, Lisboa',
  description: 'A lovely apartment in Alges along the river.',
  price: 100,
  photo:"https://images.unsplash.com/photo-1560026301-88340cf16be7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
  user_id: user1.id
)

