# == Schema Information
#
# Table name: cities
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(FALSE)
#

class City < ApplicationRecord
  has_many :users
  has_many :ambassadorships
  has_many :ambassadors, through: :ambassadorships, source: :user

  has_one_attached :photo

  scope :active, -> { where(active: true) }

  def inactive?
    !active?
  end

  def guests
    # TODO not hosts
    users
  end

  def hosts
    # TODO hosts
    users
  end

  def to_s
    "#{name}"
  end
end
