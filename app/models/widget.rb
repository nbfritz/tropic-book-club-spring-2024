class Widget < ApplicationRecord
  belongs_to :manufacturer

  def user_facing_identifier
    id_as_string = self.id.to_s
    if id_as_string.length < 3
      return id_as_string
    end

    "%{first}.%{last_two}" % {
      first: id_as_string[0..-3],
      last_two: id_as_string[-2..-1]
    }
  end
# START:edit:3
  belongs_to :widget_status
  validates :price_cents,
    numericality: { less_than_or_equal_to: 10_000_00 }
# END:edit:3
end
