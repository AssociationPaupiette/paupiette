# == Schema Information
#
# Table name: user_reviews
#
#  id         :bigint(8)        not null, primary key
#  from_id    :bigint(8)
#  about_id   :bigint(8)
#  text       :text
#  approved   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User::Review < ApplicationRecord
  belongs_to :from, class_name: 'User'
  belongs_to :about, class_name: 'User'

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }
end
