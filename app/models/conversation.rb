# == Schema Information
#
# Table name: conversations
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages

  def self.between(user, other_user)
    from_ids = user.conversations.pluck(:id)
    to_ids = other_user.conversations.pluck(:id)
    ids = from_ids & to_ids
    find_by id: ids
  end
end
