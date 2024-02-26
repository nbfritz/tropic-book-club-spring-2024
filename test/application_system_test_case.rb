require "test_helper"
require "support/with_clues"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
# START:edit:3
  include TestSupport::WithClues
# END:edit:3
  driven_by :rack_test
end
