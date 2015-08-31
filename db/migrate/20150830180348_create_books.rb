class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :subtitle
      t.date :release_date
      t.decimal :price, precision: 7, scale: 2
      t.integer :edition
      t.integer :pages
      t.text :abstract

      t.timestamps null: false
    end
  end
end
