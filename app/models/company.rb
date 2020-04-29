class Company < ApplicationRecord
  # belongs_to: 子が紐づいている親を表す
  belongs_to :small_category, inverse_of: :companies
  attachment :company_image
end
