class Category < ApplicationRecord

	has_many :products, dependent: :destroy
	has_many :keywords, dependent: :destroy
	validates :name, presence:true
	validates :name, uniqueness: { case_sensitive: false }

end
