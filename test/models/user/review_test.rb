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

require 'test_helper'

class User::ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
