class LargecategoriesController < ApplicationController

  def index
    @largecategories = LargeCategory.all
    @smallcategories = SmallCategory.all
    @companies = Company.all
    # @large_categories = LargeCategory.all.includes(:small_categories)
    # @small_categories = SmallCategory.all.includes(:companies)
  end

  def new
  	# インスタンス作成
  	@large_category = LargeCategory.new
    small_category = @large_category.small_categories.build
    small_category.companies.build
  end

  def create
    # find_or_create_by：条件検索に一致しない場合のみ登録し、条件に合致する内容があれば取得する
  	@large_category = LargeCategory.find_or_create_by(large_category_name: params[:large_category][:large_category_name])
    # update_attributes：データベースの値を複数同時に更新するために利用する
    p params[:large_category][:small_categories_attributes]
    p params[:large_category][:small_categories_attributes]["0"]
    if @large_category.check(params[:large_category][:small_categories_attributes]["0"][:small_category_name],
      params[:large_category][:small_categories_attributes]["0"][:companies_attributes]["0"][:company_name]) == nil
    @large_category.update_attributes(large_category_params)
      if @large_category.save
        redirect_to companies_path
      else
        render :new
      end
    end
  end

  def find_or_create_by(attributes, &block)
    find_by(attributes) || create(attributes, &block)
  end

private
def large_category_params
  # formから送られてくるパラメータの取得（ストロングパラメーター）# 親子孫のデータの作成
  params.require(:large_category).permit(:large_category_name, small_categories_attributes:
    [
        :small_category_name, companies_attributes:
          [
              :company_name, :company_image]
    ]
  )
end

end