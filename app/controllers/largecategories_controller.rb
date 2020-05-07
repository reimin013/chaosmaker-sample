class LargecategoriesController < ApplicationController

  def index
    @large_categories = LargeCategory.all.includes(:small_categories)
    @small_categories = SmallCategory.all.includes(:companies)
  end

  def new
  	# インスタンス作成
  	@large_category = LargeCategory.new
    small_category = @large_category.small_categories.build
    small_category.companies.build
  end

  def create
    # 親子孫のデータの作成
  	large_category = LargeCategory.find_or_create_by(large_category_name: params[:large_category][:large_category_name])
    large_category.update_attributes(large_category_params)
    if large_category.save
      redirect_to largecategories_path
    else
      render :new
    end
  end

  def find_or_create_by(attributes, &block)
    find_by(attributes) || create(attributes, &block)
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