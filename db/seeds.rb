# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

city_paris = City.where(name: "Paris", active: true).first_or_create
city_bordeaux = City.where(name: "Bordeaux").first_or_create

user_pa = User.where(first_name: 'Pierre-André', last_name: 'Boissinot', email: 'paboissinot@lespoupees.paris').first_or_initialize
unless user_pa.persisted?
  user_pa.description = "Description Pierre-André"
  user_pa.admin = true
  user_pa.password = "180379"
  user_pa.password_confirmation = "180379"
  user_pa.city = city_paris
  user_pa.save
end

user_arnaud = User.where(first_name: 'Arnaud', last_name: 'Levy', email: 'alevy@lespoupees.paris').first_or_initialize
unless user_arnaud.persisted?
  user_arnaud.description = "Description Arnaud"
  user_arnaud.admin = true
  user_arnaud.password = "alev0086"
  user_arnaud.password_confirmation = "alev0086"
  user_arnaud.city = city_paris
  user_arnaud.save
end

user_seb = User.where(first_name: 'Sébastien', last_name: 'Gaya', email: 'sgaya@lespoupees.paris').first_or_initialize
unless user_seb.persisted?
  user_seb.description = "Description Sébastien"
  user_seb.admin = true
  user_seb.password = "sgaya3399"
  user_seb.password_confirmation = "sgaya3399"
  user_seb.city = city_bordeaux
  user_seb.save
end