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
#  profile_status         :integer          default("incomplete")
#  role                   :integer          default("guest")
#  city_id                :bigint(8)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :host_sign_up
  serialize :reception_days, Array

  before_create :set_role

  has_one_attached :photo
  has_one_attached :identity_card

  belongs_to :city, optional: true

  validates_presence_of :first_name, :city_id, on: :update_profile

  enum role: { guest: 0, host: 10, ambassador: 20, admin: 30 }
  enum profile_status: { incomplete: 0, pending: 1, approved: 2, refused: 3 }

  private

  def set_role
    self.role = :host if host_sign_up == "1"
  end
end
