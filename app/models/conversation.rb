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
  has_many :messages, dependent: :destroy

  default_scope { order(updated_at: :desc) }

  def self.between(user, other_user)
    from_ids = user.conversations.pluck(:id)
    to_ids = other_user.conversations.pluck(:id)
    ids = from_ids & to_ids
    find_by id: ids
  end

  def other(user)
    users.where.not(id: user.id)
  end

  def mark_as_read_by!(user)
    messages.where.not(from_id: user.id).each do |message|
      message.mark_as_read_by!(user)
    end
  end
end
