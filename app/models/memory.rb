class Memory < ApplicationRecord
  belongs_to :memorybox

  has_one_attached :media

  validates :text, :title, presence: true
end
