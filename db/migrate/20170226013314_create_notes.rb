class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :page
      t.belongs_to :user
      t.text :body
      t.timestamps
    end
  end
end
