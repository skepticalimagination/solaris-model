circleInRadians = 2 * Math.PI

export default
  degreesToRadians: (v) -> v * (Math.PI / 180)
  radiansToDegrees: (v) -> v * (180 / Math.PI)
  normalizeRadians: (v) -> v % circleInRadians
