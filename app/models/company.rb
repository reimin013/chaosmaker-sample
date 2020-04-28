class Company < ApplicationRecord
  belongs_to :small_category
  attachment :company_image
end
