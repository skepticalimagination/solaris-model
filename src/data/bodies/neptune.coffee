export default
  name: 'Neptune'
  type: 'planet'
  radius: 24624
  mass: 102.41e24
  tilt: 29.56
  elements:
    format: 'jpl-1800-2050'
    base: {a: 30.06992276, e: 0.00859048, i: 1.77004347, L: -55.12002969, lp: 44.96476227, node: 131.78422574}
    cy: {a: 0.00026291, e: 0.00005105, i: 0.00035372, L: 218.45945325, lp: -0.32241464, node: -0.00508664}
  satellites:
    triton:
      name: 'Triton'
      type: 'moon'
      radius: 1352.6
      mass: 214.7e20
      tilt: 0.010 # http://ssd.jpl.nasa.gov/?sat_elem
      elements:
        format: 'jpl-satellites-table'
        base: {a: 354759, e: 0, i: 156.865, L: 596.007, lp: 243.75, node: 177.608}
        day: {M: 61.2572638}
