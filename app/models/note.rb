class Note < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :validate_page_number

private
  def validate_page_number
    if page_number <= 0
      errors.add(:page_number, "must be greater than zero!")
    end
  end

end
