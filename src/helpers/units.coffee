import constants from '../data/constants'

export default
  kmToMeters: (v) -> v * 1000
  metersToKM: (v) -> v / 1000
  AUToMeters: (v) -> v * constants.metersInAU
  metersToAU: (v) -> v / constants.metersInAU
