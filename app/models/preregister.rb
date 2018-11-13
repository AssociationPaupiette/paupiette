# == Schema Information
#
# Table name: preregisters
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  email      :string
#  city_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Preregister < ApplicationRecord
  belongs_to :city, optional: true
  validates_presence_of :email
  validates_uniqueness_of :email
end
