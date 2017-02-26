class ReadingList < ApplicationRecord
  belongs_to :club
  belongs_to :book
end
