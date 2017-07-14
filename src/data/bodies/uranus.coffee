export default
  name: 'Uranus'
  type: 'planet'
  radius: 25362
  mass: 86.8103e24
  tilt: 97.86
  elements:
    format: 'jpl-1800-2050'
    base: {a: 19.18916464, e: 0.04725744, i: 0.77263783, L: 313.23810451, lp: 170.95427630, node: 74.01692503}
    cy: {a: -0.00196176, e: -0.00004397, i: -0.00242939, L: 428.48202785, lp: 0.40805281, node: 0.04240589}
  satellites:
    titania:
      name: 'Titania'
      type: 'moon'
      radius: 788.9
      mass: 35.27e20
      elements:
        format: 'jpl-satellites-table'
        base: {a: 436300, e: 0.0011, i: 0.079, L: 408.785, lp: 384.171, node: 99.771}
        day: {M: 41.3514246}
