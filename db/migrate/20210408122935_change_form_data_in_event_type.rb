class ChangeFormDataInEventType < ActiveRecord::Migration[6.0]
  def change
    change_column :event_types, :form_data, :text
  end
end
