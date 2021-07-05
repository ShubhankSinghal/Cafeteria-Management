class MenuItem < ActiveRecord::Base
  has_many :order_items
  belongs_to :menu_category
end
