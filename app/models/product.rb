class Product < ApplicationRecord

  belongs_to :category
  validates :name, :color, :size, :price, presence: true
  validates :name, uniqueness: { case_sensitive: false }

end
