class Memorybox < ApplicationRecord
  belongs_to :timecapsule
  belongs_to :user
end
