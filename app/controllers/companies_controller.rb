class CompaniesController < ApplicationController

  def new
  	# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @company = Company.new
    @smallcategories = SmallCategory.all
    # @large_category = LargeCategory.new
  end

  def create
  	# ストロングパラメータを使用
  	company = Company.new(company_params)
  	# DBへ保存する
  	if company.save
  	# 一覧画面へリダイレクト
  	  redirect_to companies_path
    else
      render :new
    end
  end

  def index
    @largecategory = LargeCategory.find(1)
    @smallcategories = SmallCategory.where(large_category_id: 1)
  	@companies = Company.where(small_category_id: 1..2)
  end

# 投稿データのストロングパラメータ
private
  def company_params
    params.require(:company).permit(:company_name, :company_image, :small_category_id)
  end

end
