# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

require 'rest-client'

rm = RestClient.get 'https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=40'


results = JSON.parse(rm)

results['data'].each do |anime|
    Anime.create(
    title: anime['attributes']['titles']['en'],
    img_url: anime['attributes']['posterImage']['medium'],
    description: anime['attributes']['synopsis'],
    screen: anime['attributes']['subtype'],
    age_rating: anime['attributes']['ageRating']
    )
end

User.create(
    username: 'Ronan',
    password: 'ronan',
    img_url: 'https://ca.slack-edge.com/T02MD9XTF-U0136H00BFW-5315a4c7fdc2-512'
)





# "first": "https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0",
# "next": "https://kitsu.io/api/edge/anime?page[limit]=5&page[offset]=5",
# "last": "https://kitsu.io/api/edge/anime?page[limit]=5&page[offset]=12062"