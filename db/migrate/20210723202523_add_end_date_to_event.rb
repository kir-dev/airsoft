class AddEndDateToEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :date, :start
    add_column :events, :end, :datetime
  end
end
