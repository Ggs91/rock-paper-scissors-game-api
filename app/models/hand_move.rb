class HandMove < ApplicationRecord
  validates :name, presence: true
  belongs_to :player, optional: true
end
