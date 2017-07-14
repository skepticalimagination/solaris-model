{expect} = require 'chai'
import SolarSystem from '../src'
import time from '../src/helpers/time'
import units from '../src/helpers/units'

system = new SolarSystem
{mercury, venus, earth, moon, mars, jupiter, saturn, uranus, neptune, pluto} = system.bodies

suite 'CelestialBody', ->
  suite '#getElementsAtTime', ->
    suite 'period', ->
      t = (body, expected, tolerance = 0.005) ->
        elements = body.getElementsAtTime(time.parse '2017-03-01')
        result = time.secondsToDays(elements.period)
        diff = Math.abs(result - expected)
        test "period of #{body.name} in days should be within #{tolerance} days of #{expected},
          got #{result} (diff: #{diff})", ->
          expect(diff).to.be.closeTo(0, tolerance)

      # TODO: origin of data unknown, use data from a reputable source
      t mercury, 87.96946593127767
      t venus, 224.70267418246885
      t earth, 365.25832830801806, 0.007
      t mars, 686.9925840073605, 0.02
      t jupiter, 4334.759603064555, 0.08
      t saturn, 10757.069262176123, 0.2
      t uranus, 30703.12144501929, 0.6
      t neptune, 60227.78559374612, 1.05
      t pluto, 90614.78606946528, 1.6

  suite '#getPositionAtTime', ->
    test 'regression', ->
      t = (body, date, expected) ->
        position = body.getPositionAtTime(time.parse date)
        expect(position).to.eql(expected)
      
      # These are positions calculated by this library itself.
      # This is only intended to catch obvious regressions.
      t earth, '1961-04-12', [-139442452034.70178, -55111040949.54, -4807389.233153472]
      t moon, '1969-07-20', [-378091223.6945349, -72865416.87274396, 67361616.16847913]
      t mars, '1971-12-02', [194125907369.5938, 86905398104.50029, -2963405550.0858736]
      t pluto, '2015-07-14', [158679291342.67923, -4712888891453.035, 458416004709.8094]
      t earth, '2015-12-21', [1421169476.0365627, 147159704832.33496, -5349858.221848415]
      t mars, '2029-07-27', [-77828835882.64236, -210727634471.04758, -2508411249.8321695]

    test 'against JPL Horizons', ->
      t = (body, date, accuracy, expected) ->
        expected = expected.map (v) -> units.AUToMeters(v)
        position = body.getPositionAtTime(time.parse date)
        expect(position[0]).to.be.closeTo expected[0], Math.abs(expected[0] * accuracy[0]), "#{body.key}'s x on #{date}"
        expect(position[1]).to.be.closeTo expected[1], Math.abs(expected[1] * accuracy[1]), "#{body.key}'s y on #{date}"
        expect(position[2]).to.be.closeTo expected[2], Math.abs(expected[2] * accuracy[2]), "#{body.key}'s z on #{date}"
      
      # The goal is to get progressively closer to Horizons over time. Still a LONG way to go... :)
      # https://ssd.jpl.nasa.gov/horizons.cgi
      t earth, '1961-04-12', [0.008, 0.04, 0.6], [-9.250383416478648e-01, -3.823266951149357e-01, -7.298068361509129e-05]
      t moon, '1969-07-20', [0.04, 1.8, 12], [-2.607829429186690e-03, -1.786051948285101e-04, -4.480028687234017e-05]
      t mars, '1971-12-02', [0.04, 0.16, 0.2], [1.256453821979334e+00, 6.883129207960700e-01, -1.661222774483435e-02]
      t pluto, '2015-07-14', [0.9, 0.02, 1.8], [8.006298586187835e+00, -3.190136874743678e+01, 1.097748470103742e+00]
      t earth, '2015-12-21', [0.6, 0.002, 0.9], [1.972497168444460e-02, 9.849694408049781e-01, -1.964987733162175e-04]
      t mars, '2029-07-27', [0.21, 0.032, 0.35], [-6.563036746584133e-01, -1.365480484416584e+00, -1.246533653385676e-02]

  suite '#getOrbitPath', ->
    test 'number of vertices', ->
      expect(earth.getOrbitPath().length).to.equal 360
