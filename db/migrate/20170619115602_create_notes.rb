class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :text
      t.date :toDate
      t.integer :status
      t.string :icon
      t.string :color

      t.timestamps
    end
  end
end
