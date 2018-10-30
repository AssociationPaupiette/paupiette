# == Schema Information
#
# Table name: cities
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ApplicationRecord
  has_many :users
  has_and_belongs_to_many :ambassadors, class_name: "User", join_table: "embassies"

  def to_s
    "#{name}"
  end
end
