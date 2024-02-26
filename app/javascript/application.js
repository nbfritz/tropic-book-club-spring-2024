// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
/* START:edit:3 */
import { Turbo } from "@hotwired/turbo-rails"

// The default of 500ms is too long and
// users can lose the causal link between clicking
// a link and seeing the browser respond
Turbo.setProgressBarDelay(100)

/* END:edit:3 */
import "controllers"
