# == Schema Information
#
# Table name: event_types
#
#  id         :bigint           not null, primary key
#  form_data  :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EventType < ApplicationRecord
  EVENT_TYPE_JSON_SCHEMA = Rails.root.join('config', 'schemas', 'event_type.json').to_s

  validates :json_form_data, presence:true, json: {schema: EVENT_TYPE_JSON_SCHEMA}

  has_many :events

  def json_form_data
    JSON.parse(form_data)
  end

  def json_form_validation_schema
    schema = { "type": "object", "properties": {}, "additionalProperties": false, "required":[]}
    json_form_data.each do |name, value|
      schema[:properties][name] = value["multiple"] == true ?
                                    {"type": "array", "items": {"type": "string"} } :
                                    {"type": "string"}
      if value["required"] == true
        schema[:required] << name
      end
    end
    return schema
  end

end
