class AddLocation < ActiveRecord::Migration[5.2]
  def change

          add_column :reviews, :address, :text
          add_column :reviews, :latitude, :float
          #float means there are decimal places
          add_column :reviews, :longitude, :float


  end

end
