class User < ActiveRecord::Base
  enum role: [:owner, :clerk, :customer]
  has_many :orders

  validates :first_name, presence: true
  validates :email, presence: true

  has_secure_password

  def to_pleasant_string
    "#{id}. #{first_name.to_s} #{email} #{password}"
  end
end
