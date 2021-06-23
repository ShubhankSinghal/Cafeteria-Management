class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.integer :menu_category_id
      t.string :name
      t.text :description
      t.decimal :price
      t.timestamps
    end
  end
end
