class LargecategoriesController < ApplicationController

  def new
  	# インスタンス作成
  	@large_category = LargeCategory.new
    @small_category = SmallCategory.new
    @company = Company.new
    # small_categories = @largecategory.small_categories.build
    # small_categories.companies.build
  end

  def create
    # 親子孫のデータの作成
  	large_category = LargeCategory.new(large_category_params)
    small_category = SmallCategory.new(small_category_params[:small_category])
    company = Company.new(company_params[:company])
    large_category.save
    small_category.save
    company.save
    redirect_to largecategories_path
  rescue
    render :new
  end

  def index
    @large_categories = LargeCategory.all
    @small_categories = SmallCategory.all
    @companies = Company.all
  end

private
def large_category_params
  # formから送られてくるパラメータの取得（ストロングパラメーター）
  params.require(:large_category).permit(:large_category_name)
end

def small_category_params
  params.require(:large_category).permit(small_category:[:small_category_name])
end

def company_params
  params.require(:large_category).permit(company:[:company_name, :company_image])
end

end