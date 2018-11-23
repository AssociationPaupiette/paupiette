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
#  confirmed  :integer          default(1)
#  remaining  :integer
#

class Meal < ApplicationRecord
  belongs_to :host, class_name: "User"

  validates_presence_of :date, :capacity, :confirmed
  validates :capacity, numericality: { greater_than_or_equal_to: 1 }
  validates :confirmed, numericality: { less_than_or_equal_to: :capacity, greater_than_or_equal_to: 0 }
  validate :date_cannot_be_in_the_past

  scope :future, -> { where('date >= ?', Date.today) }
  scope :not_full, -> { where('remaining > 0') }
  scope :opened, -> { future.not_full }

  before_validation :denormalize_remaining

  protected

  def denormalize_remaining
    self.remaining = self.capacity - self.confirmed
  end

  def date_cannot_be_in_the_past
    if date.present? && date.past?
      errors.add(:date, "ne peut pas être déjà passée")
    end
  end
end
