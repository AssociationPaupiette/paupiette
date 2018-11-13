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
end
