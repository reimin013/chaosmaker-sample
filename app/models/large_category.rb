class LargeCategory < ApplicationRecord
  # has_many: 1:nの関係を表す
  has_many :small_categories, dependent: :destroy
  # 親作成時に子供も作成できるようになる
  accepts_nested_attributes_for :small_categories
end
