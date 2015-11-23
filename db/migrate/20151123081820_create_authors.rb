class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :second_name

      t.timestamps null: false
    end
  end
end
