module ParticipationsHelper

  def get_table_headers(event_type)
    schema = JSON.parse event_type.schema
    schema["properties"].map do |key,prop|
      {:key => key, :name => prop["title"]}
    end
  end


end
