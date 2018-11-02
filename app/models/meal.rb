# == Schema Information
#
# Table name: meals
#
#  id         :bigint(8)        not null, primary key
#  date       :datetime
#  host_id    :bigint(8)
#  capacity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Meal < ApplicationRecord
  belongs_to :host, class_name: "User"
end
