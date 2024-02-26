require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
# START:edit:3
  driven_by :rack_test
# END:edit:3
end
