class JsonFormBuilder < BootstrapForm::FormBuilder

  def json_field(method, options = {})
    schema = options.fetch(:schema, {})
    case schema['type']
    when *text_based_fields
      self.public_send schema['type'] + '_field', method, objectify_options(text_based_options(schema))
    when 'textarea'
      self.text_area method, objectify_options(text_area_options(schema))
    when 'checkbox'
      self.check_box method
    when 'radio_group'
      items = schema['items']
      self.collection_radio_buttons(method, items, :to_s, :to_s) if items.any?
    when 'number'
      self.number_field method, objectify_options(number_field_options(schema))
    when 'select'
      items = schema['items']
      self.collection_select(method, items, :to_s, :to_s, { }, select_options(schema)) if items.any?
    end
  end

  private

  def text_based_fields
    %w[text phone email]
  end

  def text_based_options(options)
    options.slice('required', 'pattern', 'placeholder', 'maxlength')
  end

  def text_area_options(options)
    options.slice('required','cols', 'rows', 'size')
  end

  def number_field_options(options)
    options.slice('required','min','max','step')
  end

  def select_options(options)
    options.slice('multiple')
  end
end
