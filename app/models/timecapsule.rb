class Timecapsule < ApplicationRecord
  belongs_to :user
  has_many :memoryboxes
  # has_many :memories, through: :memoryboxes
end
