class Product < ApplicationRecord 
    belongs_to :bank
    validates :name, presence: true
end
