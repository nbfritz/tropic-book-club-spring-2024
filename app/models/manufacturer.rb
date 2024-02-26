class Manufacturer < ApplicationRecord
# START:edit:3
  has_many :widgets
# END:edit:3
end
