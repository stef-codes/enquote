class Book < ApplicationRecord
    has_many :quotes
    has_many :users, through: :quotes

    validates :author, presence: true 
    validates :name, :presence => true, :uniqueness => true

    accepts_nested_attributes_for :quotes, reject_if: :all_blank

    scope :search_book, ->(book_search) { where("name LIKE ?", "%#{book_search}%") }
    
end
