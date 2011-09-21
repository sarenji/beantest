#!/usr/bin/env node

path = require 'path'
fs   = require 'fs'

process.env.NODE_ENV = 'test' unless process.env.NODE_ENV

require path.join(__dirname, '../lib/cli.js')