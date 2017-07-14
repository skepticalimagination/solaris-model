{expect} = require 'chai'
time = require '../src/helpers/time'

suite 'time', ->
  test '#parse', ->
    expect(time.parse('2017-03-01')).to.eql new Date(Date.UTC 2017, 2, 1, 12, 0, 0)

  test '#daysBetween', ->
    expect(time.daysBetween(time.parse('2017-03-01'), time.parse('2017-02-01'))).to.equal 28

  suite '#centuriesBetween', ->
    test "one century", ->
      expect(time.centuriesBetween(time.parse('2117-03-01'), time.parse('2017-03-01'))).to.equal 1

    test "half a century", ->
      expect(time.centuriesBetween(time.parse('2067-03-01'), time.parse('2017-03-01'))).to.equal 0.5

  suite '#secondsToDays', ->
    test "one day", ->
      expect(time.secondsToDays(86400)).to.equal 1

    test "fractional day", ->
      expect(time.secondsToDays(151200)).to.equal 1.75
