# frozen_string_literal: true

class LabelWithErrorComponent < ViewComponent::Base
# START:edit:3
  attr_reader :record, :field_name, :form

# END:edit:3
  def initialize(record:, field_name:, form:)
    @record = record
    @field_name = field_name
    @form = form
  end

end
