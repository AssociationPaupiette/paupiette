# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  description            :text
#  specialties            :text
#  reception_days         :string
#  city_id                :bigint(8)
#  last_name              :string
#  host                   :boolean          default(FALSE)
#  admin                  :boolean          default(FALSE)
#  slug                   :string           default(""), not null
#  active                 :boolean          default(TRUE), not null
#  approved               :boolean          default(FALSE)
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  attr_accessor :host_sign_up
  serialize :reception_days, Array

  belongs_to :city, optional: true
  has_many :ambassadorships, dependent: :destroy
  has_many :managed_cities, through: :ambassadorships, source: :city
  has_and_belongs_to_many :conversations
  has_many :messages_sent, class_name: 'Message', foreign_key: :from_id, dependent: :destroy

  has_one_attached :photo
  has_one_attached :identity_card

  validates_presence_of :first_name, :last_name, :city_id, on: :update_profile
  validates_presence_of :slug
  validates_uniqueness_of :slug

  before_validation :set_default_slug, on: :create
  before_create :set_host
  before_destroy { conversations.clear }

  # Every user is a guest
  scope :guests, -> {}
  scope :hosts, -> { where(host: true) }
  scope :not_hosts, -> { where(host: false) }
  scope :ambassadors, -> { includes(:ambassadorships).where.not(ambassadorships: { user_id: nil }) }
  scope :not_ambassadors, -> { where.not(id: ambassadors) }
  scope :admins, -> { where(admin: true) }
  scope :not_admins, -> { where(admin: false) }
  scope :approved, -> { where(approved: true) }
  scope :not_approved, -> { where(approved: false) }
  scope :to_approve, -> { not_approved.joins(identity_card_attachment: :blob) }
  scope :search, -> (term) { 
    where('email LIKE ? OR slug LIKE ? OR first_name LIKE ? OR last_name LIKE ?', 
      term, term, "%#{term}%", "%#{term}%")
  }
  default_scope { order(:last_name, :first_name) }

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def to_s
    full_name.blank? ? "Utilisateur anonyme #{id}" : "#{full_name}"
  end

  def to_short_s
    first_name.blank? ? "Utilisateur anonyme #{id}" : "#{first_name}"
  end

  def localized_reception_days
    days = I18n.t("date.day_names").rotate
    return reception_days.map { |index| days[index.to_i].capitalize }
  end

  def ambassador?
    self.managed_cities.count > 0
  end

  private

  def set_host
    # FIXME
    self.host = true if host_sign_up == "true"
  end

  def set_default_slug
    create_slug
    while slug_already_in_use?
      create_slug
    end
  end

  def create_slug
    self.slug = SecureRandom.uuid
  end

  def slug_already_in_use?
    User.where(slug: self.slug).where.not(id: id).exists?
  end
end
