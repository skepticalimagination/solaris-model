export default
  name: 'Earth'
  type: 'planet'
  radius: 6371.01
  mass: 5.97219e24
  tilt: 23.45
  elements: # actually the Earth-Moon system's barycenter
    format: 'jpl-1800-2050'
    base: {a: 1.00000261, e: 0.01671123, i: -0.00001531, L: 100.46457166, lp: 102.93768193, node: 0}
    cy: {a: 0.00000562, e: -0.00004392, i: -0.01294668, L: 35999.37244981, lp: 0.32327364, node: 0}
  satellites:
    moon:
      name: 'The Moon'
      type: 'moon'
      radius: 1737.4
      mass: 734.9e20
      tilt: 6.67
      elements:
        format: 'jpl-satellites-table'
        base: {a: 384400, e: 0.0554, i: 5.16, L: 578.5, lp: 443.23, node: 125.08}
        day: {M: 13.176358}
    iss:
      name: 'ISS'
      type: 'spacecraft'
      radius: (0.1085 * 0.0728) / 2
      elements:
        format: 'heavens-above'
        # a: earth's radius + ((perigee + apogee) / 2), in km
        base: {a: 6378.1596564 + ((399 + 408) / 2), e: 0.0006514, i: 51.6424, L: 645.0066, lp: 480.9673, node: 284.9119}
        day: {M: 360 * 15.54381896}
