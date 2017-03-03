class Book < ApplicationRecord
  has_many :reading_lists
  has_many :clubs, through: :reading_lists
  has_many :notes
  has_many :readers, through: :notes

  self.primary_key = 'goodreads_id'
end
