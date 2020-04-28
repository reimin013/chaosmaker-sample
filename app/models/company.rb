class Company < ApplicationRecord
  # belongs_to: 子が紐づいている親を表す
  belongs_to :small_category
  attachment :company_image
end
