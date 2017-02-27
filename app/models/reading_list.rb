class ReadingList < ApplicationRecord
  belongs_to :club
  belongs_to :book

  validates_uniqueness_of :book_id, scope: [:club_id]
end
