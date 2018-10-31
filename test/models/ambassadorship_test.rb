# == Schema Information
#
# Table name: ambassadorships
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AmbassadorshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
