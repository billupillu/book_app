class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, limit: 100
      t.string :isbn, limit: 13
      t.text :description
      t.date :published_at
      t.integer :publisher_id
      t.integer :page_count
      t.decimal :price, precision: 16, scale: 2

      t.timestamps null: false
    end
  end
end
