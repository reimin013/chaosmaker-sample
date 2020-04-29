class LargecategoriesController < ApplicationController

  def new
  	# インスタンス作成
  	@large_category = LargeCategory.new
    small_category = @large_category.small_categories.build
    small_category.companies.build
    # small_categories = @largecategory.small_categories.build
    # small_categories.companies.build
  end

  def create
    # 親子孫のデータの作成
  	@large_category = LargeCategory.create(large_category_params)
    @large_category.save
    redirect_to largecategories_path
  end

  def index
    @large_categories = LargeCategory.all
    @small_categories = SmallCategory.all
    @companies = Company.all
  end

private
def large_category_params
  # formから送られてくるパラメータの取得（ストロングパラメーター）
  params.require(:large_category).permit(:large_category_name, small_categories_attributes:
    [
        :small_category_name, companies_attributes:
          [
              :company_name, :company_image]
    ]
  )
end

end