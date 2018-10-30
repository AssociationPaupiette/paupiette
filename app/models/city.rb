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
  has_many :ambassadorships
  has_many :ambassadors, through: :ambassadorships, source: :user

  scope :active, -> { where(active: true) }

  def to_s
    "#{name}"
  end
end
