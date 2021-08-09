class Keyword < ApplicationRecord
  
  belongs_to :category
  validates :name, presence:true, uniqueness: { case_sensitive: false }
  
end
