require 'csv'
module ParticipationsHelper
  def get_table_headers(event_type)
    schema = JSON.parse event_type.schema
    schema['properties'].map do |key, prop|
      { key: key, name: prop['title'] }
    end
  end

  def generate_participation_csv(event)
    headers = get_table_headers(event.event_type)

    CSV.generate(headers: true) do |csv|
      csv << (%w[email registration_date] + headers.pluck(:name))
      event.participations.each do |participation|
        csv << ([participation.user.email, participation.created_at] + headers.map do |header|
          participation.form_data[header[:key]]
        end)
      end
    end
  end
end
