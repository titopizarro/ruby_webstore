class Product < ApplicationRecord

  has_and_belongs_to_many :stores
  belongs_to :category
  validates :name, :color, :size, :price, presence: true
  # validates :name, uniqueness: { case_sensitive: false }

end
