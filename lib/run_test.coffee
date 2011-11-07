path = require 'path'

# constants
SPEC_FOLDER = path.join process.cwd(), 'spec'
SHOW_COLORS = true
IS_VERBOSE  = false
TITLE       = 'beantest'

# check if spec folder exists
unless path.existsSync(SPEC_FOLDER)
  console.log 'Error: Could not find the spec folder from which to run tests!'
  process.exit 1

# run tests
jasmine = require 'jasmine-node'
growl   = require 'growl'
notify  = require 'notify-send'

# run jasmine
jasmine.loadHelpersInFolder SPEC_FOLDER, /[-_]helper\.(js|coffee)$/
jasmine.executeSpecsInFolder(
  SPEC_FOLDER,
  (runner, log) ->
    results = runner.results()
    message = "#{results.passedCount}/#{results.totalCount} tests passed."
    urgency = 'low'
    if results.failedCount > 0
      message = "#{results.failedCount} tests failed! #{message}"
      urgency = 'critical'
    growl.notify message, title: TITLE
    notify[urgency].category(TITLE).notify message
  ,
  IS_VERBOSE,
  SHOW_COLORS,
  false,
  /spec\.(js|coffee)$/i,
  {report: false}
)