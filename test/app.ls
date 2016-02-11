'use strict'

require! '../src/index.ls' : resistance
require! 'chai': {expect}

describe "resistance.js Testing Specifications" ->

    resistors = [1, 2, 3]

    series = resistance resistors, 'series'
    parallel = resistance resistors, 'parallel'

    specify 'Series: Equivalent resistance is equal to the sum of all resistors which make up the association' ->
        expect(series).to.equal(6)

    specify 'Series: Equivalent resistance is greater than the greatest resistor in the association' ->
        expect(series).to.be.above(resistors[2])

    specify 'Parallel: Equivalent resistance is equal to the inverse of the sum of all the inverted resistors which make up the association' ->
        expect(parallel).to.equal(0.5454545454545455)

    specify 'Parallel: Equivalent resistance is lower than the lowest resistor in the association' ->
        expect(parallel).to.be.below(resistors[0])
