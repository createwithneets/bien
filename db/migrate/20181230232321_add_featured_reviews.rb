class AddFeaturedReviews < ActiveRecord::Migration[5.2]
  def change

    add_column :reviews, :is_featured, :boolean, default: false
  end
end
