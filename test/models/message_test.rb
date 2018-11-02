# == Schema Information
#
# Table name: messages
#
#  id              :bigint(8)        not null, primary key
#  from_id         :bigint(8)
#  content         :text
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :integer
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
