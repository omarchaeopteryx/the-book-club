class Book < ApplicationRecord
  has_many :reading_lists
  has_many :clubs, through: :reading_lists
  has_many :pages
  has_many :notes, through: :pages

  self.primary_key = 'goodreads_id'
end
