class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books, id: false do |t|
      t.integer :goodreads_id, null: false
      t.string :name
      t.timestamps
    end

    add_index "books", ["goodreads_id"], name: "index_books_on_goodreads_id", unique: true, using: btree
  end
end
