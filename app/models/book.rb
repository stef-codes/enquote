class Book < ApplicationRecord
    has_many :quotes
    has_many :users, through: :quotes

    validates :author, presence: true
    validates :name, uniqueness: true

    scope :has_author, -> { has_author.where("author IS NOT NULL") }
    
end
