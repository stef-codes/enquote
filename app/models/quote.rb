class Quote < ApplicationRecord
    belongs_to :user
    belongs_to :book

    accepts_nested_attributes_for :book, reject_if: :all_blank
end
