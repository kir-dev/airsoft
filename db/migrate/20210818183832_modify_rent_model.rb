class ModifyRentModel < ActiveRecord::Migration[6.1]
  def change
    remove_column :rents, :item_id, :bigint
    add_column :rents, :order, :string
    add_column :rents, :start_date, :datetime
    add_column :rents, :comment, :string
    add_column :rents, :status, :integer, default: 0
  end
end
