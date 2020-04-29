## カオスメーカーサンプルアプリ

カースメーカー（カオスマップを自動的に生成するアプリケーション）のサンプルを作っています。

### モデル

- LargeCategoryモデル
- SmallCategoryモデル
- Companyモデル

- 1つのフォームで上記3つのテーブルに同時にレコードを作成することを試みた。
	- LargeCategoriesテーブル ⇔ SmallCategoriesテーブル ... 1対Nの親子関係
	- SmallCategoriesテーブル ⇔ Comapniesテーブル ... 1対Nの子孫関係


<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->