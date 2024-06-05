class Memory < ApplicationRecord
  belongs_to :memorybox

  validates :text, presence: true
end
