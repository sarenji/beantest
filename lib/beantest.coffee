{exec} = require 'child_process'
path   = require 'path'
fs     = require 'fs'

REFRESH_RATE = 500        # in msecs
EXECUTE_WITH = "node"
RUN_PATH     = path.join __dirname, "run_test.js"
unless path.exists RUN_PATH
  EXECUTE_WITH = "coffee"
  RUN_PATH     = path.join __dirname, "run_test.coffee"
seen         = {}         # cache of file names
shouldRun    = true       # if a change in file was detected
canRun       = true       # if tests are running right now, don't run.

runTest = (curr, prev) ->
  if curr.mtime > prev.mtime
    console.log "[beantest] Change in file detected. Rerunning tests...\n"
    shouldRun = true

beantest = (persistent=true) ->
  if shouldRun and canRun
    exec "#{EXECUTE_WITH} #{RUN_PATH}", (error, stdout, stderr) ->
      console.log(if error then stderr else stdout)
      canRun = true
    shouldRun = canRun = false
  return unless persistent
  exec 'find . | grep "\\.coffee$"', (error, stdout, stderr) ->
    fileNames = stdout.split('\n')
    for fileName in fileNames
      if fileName not of seen
        seen[fileName] = true
        fs.watchFile fileName, { interval: REFRESH_RATE }, runTest
    setTimeout beantest, REFRESH_RATE

@beantest = beantest