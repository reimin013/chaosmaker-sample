class SmallCategory < ApplicationRecord
  belongs_to :large_category
  has_many :companies, dependent: :destroy
end
