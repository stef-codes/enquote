class Book < ApplicationRecord
    has_many :quotes
    has_many :users, through: :quotes

    validates :author, presence: true
    validates :name, uniqueness: true

    accepts_nested_attributes_for :quotes, reject_if: :all_blank
    
end
