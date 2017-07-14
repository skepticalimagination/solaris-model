export default
  name: 'Jupiter'
  type: 'planet'
  radius: 69911
  mass: 1898.13e24
  tilt: 3.12
  elements:
    format: 'jpl-1800-2050'
    base: {a: 5.20288700, e: 0.04838624, i: 1.30439695, L: 34.39644051, lp: 14.72847983, node: 100.47390909}
    cy: {a: -0.00011607, e: -0.00013253, i: -0.00183714, L: 3034.74612775, lp: 0.21252668, node: 0.20469106}
  satellites:
    io:
      name: 'Io'
      type: 'moon'
      radius: 1821.3
      mass: 8933e19
      elements:
        format: 'jpl-satellites-table'
        base: {a: 421800, e: 0.0041, i: 0.036, L: 470.127, lp: 128.106, node: 43.977}
        day: {M: 203.4889583}
    europa:
      name: 'Europa'
      type: 'moon'
      radius: 1565
      mass: 4797e19
      elements:
        format: 'jpl-satellites-table'
        base: {a: 671100, e: 0.0094, i: 0.466, L: 479.092, lp: 308.076, node: 219.106}
        day: {M: 101.3747242}
    ganymede:
      name: 'Ganymede'
      type: 'moon'
      radius: 2634
      mass: 1482e20
      elements:
        format: 'jpl-satellites-table'
        base: {a: 1070400, e: 0.0013, i: 0.177, L: 573.509, lp: 255.969, node: 63.552}
        day: {M: 50.3176072}
    callisto:
      name: 'Callisto'
      type: 'moon'
      radius: 2403
      mass: 1076e20
      elements:
        format: 'jpl-satellites-table'
        base: {a: 1882700, e: 0.0074, i: 0.192, L: 532.899, lp: 351.491, node: 298.848}
        day: {M: 21.5710728}
