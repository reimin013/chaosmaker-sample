class SmallCategory < ApplicationRecord
  # belongs_to: 子が紐づいている親を表す
  belongs_to :large_category
  # has_many: 1:nの関係を表す
  has_many :companies, dependent: :destroy
  # 親作成時に子供も作成できるようになる
  accepts_nested_attributes_for :companies
end
