require 'csv'

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


  task import_users: :environment  do |args|
    desc "rake legacy:import_users url=https://url_du_csv"
    if ENV.has_key?('url')
      url = ENV['url']
      csv = CSV.new open(url), headers: :first_row
    else
      csv = CSV.read './tmp/legacy/users.csv'
    end
    csv.each_with_index do |line, index|
      next if index.zero?
      user = User.where(email: line[1]).first_or_initialize
      user.encrypted_password = line[2]
      user.last_name = line[20]
      user.first_name = line[21]
      user.host = line[14] == 'true'
      city = City.where(name: line[15]).first
      user.city = city unless city.nil?
      user.save validate: false
    end
  end
end