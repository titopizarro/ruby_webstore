class Store < ApplicationRecord

	has_many :products, dependent: :destroy
	validates :name, :street, :number, :zip_code, :city, :country, presence:true
	validates :name, uniqueness: { case_sensitive: false }

end
