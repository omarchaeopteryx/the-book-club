class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :club
      t.belongs_to :user
      t.string :notes
      t.timestamps
    end
  end
end
