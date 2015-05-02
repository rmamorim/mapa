class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.integer :numero
      t.decimal :superficie, precision: 5, scale: 2
      t.text :memorial
      t.text :coord

      t.timestamps
    end
  end
end
