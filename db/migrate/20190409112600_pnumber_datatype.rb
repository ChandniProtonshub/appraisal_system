class PnumberDatatype < ActiveRecord::Migration[5.2]
  def change
  	 change_column :users, :pnumber, :integer
  end
end
