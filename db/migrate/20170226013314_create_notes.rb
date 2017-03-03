class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :book
      t.belongs_to :user
      t.integer :page_number
      t.text :body
      t.timestamps
    end
  end
end
