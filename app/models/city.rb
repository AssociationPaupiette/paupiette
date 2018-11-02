# == Schema Information
#
# Table name: cities
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(FALSE)
#  slug       :string           default(""), not null
#

class City < ApplicationRecord
  has_many :users
  has_many :ambassadorships
  has_many :ambassadors, through: :ambassadorships, source: :user

  has_one_attached :photo

  validates_uniqueness_of :slug

  before_validation :set_slug

  scope :active, -> { where(active: true) }
  default_scope { order(:name) }

  def inactive?
    !active?
  end

  def guests
    users.not_hosts
  end

  def hosts
    users.hosts
  end

  def to_s
    "#{name}"
  end

  protected

  def set_slug
    self.slug = name.parameterize
  end
end
