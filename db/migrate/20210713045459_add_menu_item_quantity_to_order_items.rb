class AddMenuItemQuantityToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :menu_item_quantity, :integer
  end
end
