class Store < ApplicationRecord

	has_and_belongs_to_many :products
	validates :name, :street, :number, :zip_code, :city, :country, presence:true
	validates :name, uniqueness: { case_sensitive: false }

end
