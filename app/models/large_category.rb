class LargeCategory < ApplicationRecord
  has_many :small_categories, dependent: :destroy
end
