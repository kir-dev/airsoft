class CreateRentedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :rented_items do |t|

      t.timestamps
    end
  end
end
