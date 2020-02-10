# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Generate 10 groups..."
10.times do |g|
  Group.create(title:Faker::Games::LeagueOfLegends.champion,
               description:Faker::Games::LeagueOfLegends.location,
               user_id: [*1..6].sample)
end
puts "done!"