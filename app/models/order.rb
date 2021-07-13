class Order < ActiveRecord::Base
  enum status: [:cart, :pending, :delivered]
  has_many :order_items
  belongs_to :user
end
