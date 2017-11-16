class AddCountsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :created_articles, :integer, default: 0
    add_column :users, :created_debates, :integer, default: 0
  end
end
