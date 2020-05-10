class LargeCategory < ApplicationRecord
  # has_many: 1:nの関係を表す
  has_many :small_categories, dependent: :destroy, inverse_of: :large_category
  # 親作成時に子供も作成できるようになる
  accepts_nested_attributes_for :small_categories

  def check(small_category_name, company_name)
  	# p small_categories
  	small_category = small_categories.find_by(small_category_name: small_category_name)
  	if small_category
  		small_category.companies.find_by(company_name: company_name)
  	end
  end

end
