# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = [
  {name: 'Paris', active: true, latitude: 48.856614, longitude: 2.3522219000000177},
  {name: 'Bordeaux', active: true, latitude: 44.837789, longitude: 0.5791799999999512},
  {name: 'Quimper', active: true, latitude: 47.997542, longitude: -4.097898999999984},
  {name: 'Marseille', active: false, latitude: 43.296482, longitude: 5.369779999999992},
  {name: 'Lyon', active: false, latitude: 45.764043, longitude: 4.835658999999964},
  {name: 'Toulouse', active: false, latitude: 43.604652, longitude: 1.4442090000000007},
  {name: 'Nice', active: false, latitude: 43.7101728, longitude: 7.261953199999994},
  {name: 'Nantes', active: false, latitude: 47.218371, longitude: -1.553621000000021},
  {name: 'Strasbourg', active: false, latitude: 48.5734053, longitude: 7.752111300000024},
  {name: 'Montpellier', active: false, latitude: 43.610769, longitude: 3.8767159999999876},
  {name: 'Lille', active: false, latitude: 50.62925, longitude: 3.057256000000052},
  {name: 'Rennes', active: false, latitude: 48.117266, longitude: -1.6777925999999752},
  {name: 'Reims', active: false, latitude: 49.258329, longitude: 4.031696000000011},
  {name: 'Le Havre', active: false, latitude: 49.49437, longitude: 0.10792900000001282},
  {name: 'Saint Étienne', active: false, latitude: 45.439695, longitude: 4.387177899999983},
  {name: 'Toulon', active: false, latitude: 43.124228, longitude: 5.927999999999997},
  {name: 'Grenoble', active: false, latitude: 45.188529, longitude: 5.724523999999974},
  {name: 'Dijon', active: false, latitude: 47.322047, longitude: 5.041479999999979},
  {name: 'Angers', active: false, latitude: 47.47116159999999, longitude: -0.5518256999999949},
  {name: 'Brest', active: false, latitude: 48.390394, longitude: -4.4860760000000255},
  {name: 'Le Mans', active: false, latitude: 48.00611000000001, longitude: 0.1995560000000296},
  {name: 'Nîmes', active: false, latitude: 43.836699, longitude: 4.360053999999991},
  {name: 'Aix en Provence', active: false, latitude: 43.529742, longitude: 5.4474270000000615},
  {name: 'Clermont Ferrand', active: false, latitude: 45.77722199999999, longitude: 3.0870250000000397},
  {name: 'Limoges', active: false, latitude: 45.83361900000001, longitude: 1.2611050000000432},
  {name: 'Tours', active: false, latitude: 47.394144, longitude: 0.6848400000000083},
  {name: 'Amiens', active: false, latitude: 49.894067, longitude: 2.2957529999999906},
  {name: 'Villeurbanne', active: false, latitude: 45.771944, longitude: 4.89017089999993},
  {name: 'Metz', active: false, latitude: 49.1193089, longitude: 6.1757155999999895},
  {name: 'Nanterre', active: false, latitude: 48.892423, longitude: 2.215330999999992},
  {name: 'Besançon', active: false, latitude: 47.237829, longitude: 6.024053900000013},
  {name: 'Caen', active: false, latitude: 49.182863, longitude: -0.37067899999999554},
  {name: 'Rouen', active: false, latitude: 49.44323199999999, longitude: 1.0999709999999823},
  {name: 'Orléans', active: false, latitude: 47.902964, longitude: 1.9092510000000402},
  {name: 'Boulogne Billancourt', active: false, latitude: 48.8396952, longitude: 2.2399123000000145},
  {name: 'Nancy', active: false, latitude: 48.692054, longitude: 6.184416999999939},
  {name: 'Montreuil', active: false, latitude: 48.863812, longitude: 2.4484509999999773},
]

cities.each do |city|
  c = City.where(name: city[:name]).first_or_create
  c.active = city[:active]
  c.latitude = city[:latitude]
  c.longitude = city[:longitude]
  c.save
end

city_paris = City.where(name: 'Paris').first
city_bordeaux = City.where(name: 'Bordeaux').first

user_pa = User.where(first_name: 'Pierre-André', last_name: 'Boissinot', email: 'paboissinot@lespoupees.paris').first_or_initialize
unless user_pa.persisted?
  user_pa.description = 'Description Pierre-André'
  user_pa.admin = true
  user_pa.password = '180379'
  user_pa.password_confirmation = '180379'
  user_pa.city = city_paris
  user_pa.save
end

user_arnaud = User.where(first_name: 'Arnaud', last_name: 'Levy', email: 'alevy@lespoupees.paris').first_or_initialize
unless user_arnaud.persisted?
  user_arnaud.description = 'Description Arnaud'
  user_arnaud.admin = true
  user_arnaud.password = 'alev0086'
  user_arnaud.password_confirmation = 'alev0086'
  user_arnaud.city = city_paris
  user_arnaud.save
end

user_seb = User.where(first_name: 'Sébastien', last_name: 'Gaya', email: 'sgaya@lespoupees.paris').first_or_initialize
unless user_seb.persisted?
  user_seb.description = 'Description Sébastien'
  user_seb.admin = true
  user_seb.password = 'sgaya3399'
  user_seb.password_confirmation = 'sgaya3399'
  user_seb.city = city_bordeaux
  user_seb.save
end