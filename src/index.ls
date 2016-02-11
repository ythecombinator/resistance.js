'use strict'

{map, fold1} = require 'prelude-ls'

module.exports = (circuit, type) ->

  series = fold1 (+)
  parallel = -> (^ -1) fold1 (+), (map (^ -1), &0)

  switch type
  | \series   \s => series circuit
  | \parallel \p => parallel circuit
  | _            =>
    console.log 'Please enter a valid type of resistors association.'
