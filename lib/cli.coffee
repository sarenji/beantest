beantest = require './beantest'

persistent = !(process.argv.pop() == "--once")

console.log "[beantest] Starting...\n"
beantest.beantest persistent