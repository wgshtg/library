class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :intro
      t.string :author
      t.integer :price
      
      t.timestamps
    end
  end
end
