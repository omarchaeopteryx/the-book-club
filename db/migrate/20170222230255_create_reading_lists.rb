class CreateReadingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :reading_lists do |t|
      t.belongs_to :club
      t.belongs_to :book
      t.string :notes
      t.timestamps
    end
  end
end
