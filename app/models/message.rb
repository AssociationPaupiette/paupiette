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

class Message < ApplicationRecord
  belongs_to :from, class_name: "User"
  belongs_to :conversation, touch: true

  def to
    return if conversation.nil?
    conversation.users.where.not(id: from).first
  end

  def to_s
    "#{content}"
  end
end
