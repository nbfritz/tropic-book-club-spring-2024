# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# START:edit:3
# This works around an issue with Rails 7 and dotenv-rails where
# tests are run in the wrong Rails environment
if Rake.application.top_level_tasks.grep(
    /^(default$|test(:|$))/
   ).any?

  ENV["RAILS_ENV"] ||= if Rake.application.options.show_tasks
                           "development"
                         else
                           "test"
                         end

end
# END:edit:3
require_relative "config/application"

Rails.application.load_tasks
