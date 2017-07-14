export default
  name: 'Mars'
  type: 'planet'
  radius: 3389.9
  mass: 6.4185e23
  tilt: 25.19
  elements:
    format: 'jpl-1800-2050'
    base: {a: 1.52371034, e: 0.09339410, i: 1.84969142, L: -4.55343205, lp: -23.94362959, node: 49.55953891}
    cy: {a: 0.00001847, e: 0.00007882, i: -0.00813131, L: 19140.30268499, lp: 0.44441088, node: -0.29257343}
  satellites:
    phobos:
      name: 'Phobos'
      type: 'moon'
      radius: (13.1 + 11.1 + 9.3) / 3
      mass: 1.08e16
      elements:
        format: 'jpl-satellites-table'
        base: {a: 9376, e: 0.0151, i: 1.075, L: 448.9, lp: 357.841, node: 207.784}
        day: {M: 1128.8447569}
    deimos:
      name: 'Deimos'
      type: 'moon'
      radius: (7.8 * 6.0 * 5.1) / 3
      mass: 1.80e15
      elements:
        format: 'jpl-satellites-table'
        base: {a: 23458, e: 0.0002, i: 1.788, L: 610.583, lp: 285.254, node: 24.525}
        day: {M: 285.1618790}
