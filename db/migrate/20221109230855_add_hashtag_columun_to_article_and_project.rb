class AddHashtagColumunToArticleAndProject < ActiveRecord::Migration[7.0]
  AFFTECTED_TABLES = [:articles, :projects]

  def change
    AFFTECTED_TABLES.each do |tab|
      add_column tab, :hashtag, :string, default: ''
    end
  end
end
