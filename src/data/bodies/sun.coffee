import mercury from './mercury'
import venus from './venus'
import earth from './earth'
import mars from './mars'
import ceres from './ceres'
import jupiter from './jupiter'
import saturn from './saturn'
import uranus from './uranus'
import neptune from './neptune'
import pluto from './pluto'
import eris from './eris'
import sedna from './sedna'

export default
  name: 'The Sun'
  type: 'star'
  radius: 6.955e5 # IAU value according to JPL Horizons
  mass: 1.988544e30
  position: [0, 0, 0]
  satellites: {
    mercury, venus, earth, mars, ceres
    jupiter, saturn, uranus, neptune
    pluto, eris, sedna
  }
