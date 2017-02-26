class Club < ApplicationRecord
  has_many :reading_lists
  has_many :books, through: :reading_lists
  has_many :memberships
  has_many :members, through: :memberships, source: :user
end
