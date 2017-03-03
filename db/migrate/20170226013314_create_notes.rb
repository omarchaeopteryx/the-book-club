class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :book
      t.belongs_to :user
      t.integer :page_number, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
