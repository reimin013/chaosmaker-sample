class CompaniesController < ApplicationController

  def new
  	# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @company = Company.new
    # @small_category = SmallCategory.new
    # @large_category = LargeCategory.new
  end

  def create
  	# ストロングパラメータを使用
  	company = Company.new(company_params)
  	# DBへ保存する
  	company.save
  	# 一覧画面へリダイレクト
  	redirect_to companies_path
  end

  def index
  	@companies = Company.all
  end

# 投稿データのストロングパラメータ
private
  def company_params
    params.require(:company).permit(:company_name, :company_image, :small_category_id)
  end

end
