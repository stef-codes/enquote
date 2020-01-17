class Book < ApplicationRecord
    has_many :quotes
    has_many :users, through: :quotes
    
end
