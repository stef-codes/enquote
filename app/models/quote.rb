class Quote < ApplicationRecord
    belongs_to :user
    belongs_to :book

    accepts_nested_attributes_for :book, reject_if: :all_blank

    validates :content, presence: true
    validates :content, length: { minimum: 10 }


    scope :searched, ->(search_term) { where("content LIKE ?", "%#{search_term}%") }

    # scope :searched, ->(search_term) { where(“content LIKE ?", "%#{sanitize_sql_like(search_term)}%”)}
end
 