require 'csv'
require 'byebug'

class Cities
  LIST = ['Paris','Bordeaux','Quimper','Marseille','Lyon','Toulouse','Nice','Nantes','Strasbourg','Montpellier','Lille','Rennes','Reims', 'Le Havre''Saint Étienne','Toulon','Grenoble','Dijon','Angers','Brest','Le Mans','Nîmes','Aix en Provence','Clermont Ferrand','Limoges','Tours','Amiens','Villeurbanne','Metz','Nanterre','Besançon','Caen','Rouen','Orléans','Boulogne Billancourt','Nancy','Montreuil']

  def self.find(name)
    LIST.each do |city|
      if city.downcase.in? name.to_s.downcase
        puts "#{name} -> #{city}"
        return city
      end
    end
    puts "#{name} -> not found"
    return ''
  end
end

namespace :legacy do
  task :extract_preregistrations do
    preregistrations = {}
    preregistrations_launchrock = CSV.read './tmp/legacy/preregistrations_launchrock.csv'
    preregistrations_launchrock.each_with_index do |row, index|
      next if index.zero?
      values = row.first.split ';'
      email = values[1]
      city = Cities.find values[3]
      preregistrations[email] = {
        email: email,
        first_name: '',
        city: city
      }
    end

    preregistrations_form = CSV.read './tmp/legacy/preregistrations_form.csv'
    preregistrations_form.each_with_index do |row, index|
      next if index.zero?
      values = row.first.split ';'
      email = values[7]
      first_name = values[3]
      city = Cities.find values[6]
      preregistrations[email] = {
        email: email,
        first_name: first_name,
        city: city
      }
    end

    File.open('./tmp/legacy/preregistrations.csv', 'w') do |file|
      file.puts preregistrations.values.map { |p| "#{p[:email]};#{p[:first_name]};#{p[:city]}" }.join("\n")
    end
  end
end