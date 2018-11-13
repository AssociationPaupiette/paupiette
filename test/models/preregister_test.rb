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

require 'test_helper'

class PreregisterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
