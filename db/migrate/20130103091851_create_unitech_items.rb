class CreateUnitechItems < ActiveRecord::Migration
  def change
    create_table :unitech_items do |t|
      t.integer :model
      t.string :name
      t.text :desc
      t.string :cat1
      t.string :cat2
      t.string :cat3
      t.string :cat4
      t.integer :quantity
      t.float :price
      t.string :manufacturer
      t.string :manufacturer_pb
      t.float :weight
      t.string :unit

      t.timestamps
    end
  end
end
