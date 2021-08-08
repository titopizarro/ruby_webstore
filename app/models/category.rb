class Category < ApplicationRecord

	validates :name, presence:true
	validates :name, uniqueness: { case_insensitive: false }

end
