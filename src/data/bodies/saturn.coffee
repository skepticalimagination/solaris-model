export default
  name: 'Saturn'
  type: 'planet'
  radius: 60268 # equatorial radius: https://nssdc.gsfc.nasa.gov/planetary/factsheet/satringfact.html
  mass: 5.68319e26
  tilt: 26.73
  ring:
    innerRadius: 66900
    outerRadius: 137774
  elements:
    format: 'jpl-1800-2050'
    base: {a: 9.53667594, e: 0.05386179, i: 2.48599187, L: 49.95424423, lp: 92.59887831, node: 113.66242448}
    cy: {a: -0.00125060, e: -0.00050991, i: 0.00193609, L: 1222.49362201, lp: -0.41897216, node: -0.28867794}
  satellites:
    mimas:
      name: 'Mimas'
      type: 'moon'
      radius: 198.8
      mass: 375e17
      elements:
        format: 'jpl-satellites-table'
        base: {a: 185539, e: 0.0196, i: 1.574, L: 520.374, lp: 505.526, node: 173.027}
        day: {M: 381.9944948}
    enceladus:
      name: 'Enceladus'
      type: 'moon'
      radius: 252.3
      mass: 10805e16
      elements:
        format: 'jpl-satellites-table'
        base: {a: 238042, e: 0.0000, i: 0.003, L: 542.269, lp: 342.583, node: 342.507}
        day: {M: 262.7318978}
    tethys:
      name: 'Tethys'
      type: 'moon'
      radius: 536.3
      mass: 6176e17
      elements:
        format: 'jpl-satellites-table'
        base: {a: 294672, e: 0.0001, i: 1.091, L: 548.411, lp: 305.044, node: 259.842}
        day: {M: 190.6979109}
    dione:
      name: 'Dione'
      type: 'moon'
      radius: 562.5
      mass: 109572e16
      elements:
        format: 'jpl-satellites-table'
        base: {a: 377415, e: 0.0022, i: 0.028, L: 896.962, lp: 574.73, node: 290.415}
        day: {M: 131.5349307}
    rhea:
      name: 'Rhea'
      type: 'moon'
      radius: 764.5
      mass: 2309e18
      elements:
        format: 'jpl-satellites-table'
        base: {a: 527068, e: 0.0002, i: 0.333, L: 772.442, lp: 592.661, node: 351.042}
        day: {M: 79.6900459}
    titan:
      name: 'Titan'
      type: 'moon'
      radius: 2575.5
      mass: 13455.3e19
      elements:
        format: 'jpl-satellites-table'
        base: {a: 1221865, e: 0.0288, i: 0.306, L: 371.902, lp: 208.592, node: 28.060}
        day: {M: 22.5769756}
    hyperion:
      name: 'Hyperion'
      type: 'moon'
      radius: 133
      mass: 108e17
      elements:
        format: 'jpl-satellites-table'
        base: {a: 1500933, e: 0.1230061, i: 0.615, L: 653.367, lp: 567.025, node: 263.847}
        day: {M: 16.9199503}
    iapetus:
      name: 'Iapetus'
      type: 'moon'
      radius: 734.5
      mass: 180.59e19
      elements:
        format: 'jpl-satellites-table'
        base: {a: 3560854, e: 0.0293, i: 8.298, L: 554.5, lp: 352.711, node: 81.105}
        day: {M: 4.5379416}
    phoebe:
      name: 'Phoebe'
      type: 'moon'
      radius: 106.6
      mass: 8289e15
      elements:
        format: 'jpl-satellites-table'
        base: {a: 12947918, e: 0.1634, i: 175.243, L: 636.624, lp: 583.586, node: 241.086}
        day: {M: 0.6569114}
