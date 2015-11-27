class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :author_id
      t.integer :book_id
      t.timestamps null: false
    end
    add_index('publications', ['author_id', 'book_id'])
  end
end
