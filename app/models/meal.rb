class Meal < ApplicationRecord
  belongs_to :host, class_name: "User"
end
