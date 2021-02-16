class AddFormAnswersToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :form_answers, :json
  end
end
