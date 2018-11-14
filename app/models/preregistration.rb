# == Schema Information
#
# Table name: preregistrations
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  email      :string
#  city_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Preregistration < ApplicationRecord
  belongs_to :city, optional: true
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.import(csv)
    csv.lines.each do |line|
      import_line line
    end
  end

  protected

  def self.import_line(line)
    values = line.split ';'
    email = values[0].chop
    first_name = values[1].chop
    city_name = values[2].chop
    preregistration = where(email: email).first_or_create
    preregistration.first_name = first_name
    city = City.where(name: city_name).first
    preregistration.city = city unless city.nil?
    preregistration.save
  end
end
