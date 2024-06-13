class Memory < ApplicationRecord
  belongs_to :memorybox

  has_one_attached :media

  validates :text, :title, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_text,
                  against: %i[title text],
                  using: {
                    tsearch: { prefix: true }
                  }
end
