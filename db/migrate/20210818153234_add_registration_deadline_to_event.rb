class AddRegistrationDeadlineToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :deadline, :datetime
  end
end
