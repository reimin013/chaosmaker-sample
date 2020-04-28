class LargecategoriesController < ApplicationController

  def new
  	# インスタンス作成
  	@largecategory = LargeCategory.new
    small_categories = @largecategory.small_categories.build
    small_categories.companies.build
  end

  def create
    # 親子孫のデータの作成
  	@largecategory = LargeCategory.create(largecategory_params)
  end

private
def largecategory_params
  # formから送られてくるパラメータの取得（ストロングパラメーター）
  params.require(:largecategory).permit(:large_category_name, smallcategories_attributes:
  	[
  		:small_category_name, companies_attributes:
  		  [
  		    :company_name
  		  ]
    ]
  )
end

end