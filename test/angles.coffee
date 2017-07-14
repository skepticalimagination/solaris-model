{expect} = require 'chai'
import angles from '../src/helpers/angles'

circle = radians: 2 * Math.PI, degrees: 360

suite 'angles', ->
  suite '#degreesToRadians', ->
    test "half circle", -> expect(angles.degreesToRadians 180).to.equal Math.PI
    test "30 degrees", -> expect(angles.degreesToRadians 30).to.equal circle.radians / circle.degrees * 30

  suite '#radiansToDegrees', ->
    test "half circle", -> expect(angles.radiansToDegrees Math.PI).to.equal 180
    test "2 radians", -> expect(angles.radiansToDegrees 2).to.equal circle.degrees / circle.radians * 2

  test '#normalizeRadians', ->
    expect(angles.normalizeRadians circle.radians * 1.5).to.equal Math.PI
