class AddNewInfoToReviews < ActiveRecord::Migration[5.2]
  def change

    add_column :reviews, :phone_number, :string
    add_column :reviews, :ambiance, :string
    #the column is added to the reviews database
  end
end
