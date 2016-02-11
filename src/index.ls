'use strict'

{map, fold1} = require 'prelude-ls'

module.exports = (circuit, type) ->

    series = (circuit) -> fold1 (+), circuit
    parallel = (circuit) -> (^ -1) fold1 (+), (map (^ -1), circuit)

    switch type
    | 'series', 's' => series circuit
    | 'parallel', 'p' => parallel circuit
    | _ =>
        console.log 'Please enter a valid type of resistors association.'
