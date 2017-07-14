{expect} = require 'chai'
units = require '../src/helpers/units'

suite 'units', ->
  test '#kmToMeters', -> expect(units.kmToMeters 123).to.equal 123000
  test '#metersToKM', -> expect(units.metersToKM 123000).to.equal 123
  test '#AUToMeters', -> expect(units.AUToMeters 1.52).to.equal 227388763464
  test '#metersToAU', -> expect(units.metersToAU 227388763464).to.equal 1.52
  