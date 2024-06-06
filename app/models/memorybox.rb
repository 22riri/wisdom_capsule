class Memorybox < ApplicationRecord
  belongs_to :timecapsule
  belongs_to :user
  has_many :memories
  validates :title, presence: true
end
