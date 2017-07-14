# solaris-model

A logical model of our Solar System providing the positions of planets, moons and other celestial bodies as a function of time.

You can use it as a data source to render the Solar System, in 2D or 3D.

It also provides other info needed for rendering such as each object's radius, axial tilt, ring boundaries (if any) and orbital path.

This is a **work in progress**: the positions of the planets seem to checkout against established tools like [Celestia](https://celestiaproject.net/), but there is still a lot of work to be done on satellite orbits and other features (check the TODO list below). Please don't use it to plan the trajectory for your multibillion-dollar space probe just yet (it *will* crash - on the wrong target).

Corrections and bug reports [are welcome](https://github.com/skepticalimagination/solaris-model/issues).

## Install

Node or browser:

```
npm install solaris-model
```

Old school? Download the [tarball](https://registry.npmjs.org/solaris-model/-/solaris-model-0.1.0.tgz) and get the bundle from the `dist` folder.

```html
<script src="solaris-model.min.js"></script> <!-- sets window.SolarSystem -->
```

## Usage

CommonJS:
```javascript
let SolarSystem = require('solaris-model')
```

ES6 ([Michael Jackson script](https://medium.com/the-node-js-collection/an-update-on-es6-modules-in-node-js-42c958b890c) included!):
```javascript
import SolarSystem from 'solaris-model'
```

Both methods give you a class you can instantiate to get your model:

```javascript
let system = new SolarSystem

// Flat dictionary of all bodies in the system, by key
console.log(Object.keys(system.bodies)) // ['sun', 'mercury', 'venus', 'earth', 'moon', 'iss', ...]

let sun = system.bodies.sun
console.log(sun.key) // 'sun'
console.log(sun.name) // 'The Sun'
console.log(sun.type) // 'star'
console.log(sun.position) // [0, 0, 0]

console.log(Object.keys(sun.satellites)) // ['mercury', 'venus', 'earth', 'mars', 'ceres', ...]

let mars = sun.satellites.mars
console.log(mars.name) // 'Mars'
console.log(mars.type) // 'planet'
console.log(mars.central.name) // 'The Sun'
console.log(mars.satellites.phobos.name) // 'Phobos'

let earth = system.bodies.earth
console.log(earth.satellites.iss.name) // 'ISS'
console.log(system.bodies.iss.type) // 'spacecraft'

let saturn = system.bodies.saturn
console.log(saturn.radius) // 60268000
console.log(saturn.type) // 'planet'
console.log(saturn.mass) // 5.68319e+26
console.log(saturn.tilt) // 26.73

system.setTime('1961-04-12')

console.log(saturn.position) // in meters, relative to the sun
// [640052013047.9685, -1353546339129.1343, -1739512961.8784275]

console.log(system.bodies.europa) // in meters, relative to *jupiter*
// [666664577.6643108, -21177279.12859592, 4714819.292014049]

console.log(saturn.getOrbitPath().length) // 360

console.log(saturn.getOrbitPath())
// [
//   [-136760528961.4258, -1496030001961.143, 31460392085.67932],
//   [-113085367440.416, -1498196488549.527, 30555898430.39112],
//   ...
// ]
```

## Known issues and limitations

- The [reference data from JPL](https://ssd.jpl.nasa.gov/?planet_pos) used for the planets allows calculation of approximate positions, valid for the period from 1800 to 2050 CE. Check the same link for the approximate error table.

## To-do list

- Account for perturbations of Earth's Moon.

- Fill in remaining major dwarf planets, moons and asteroids.

- Fix satellite orbits.

- Calculate rotation angle of bodies.

- Include ring info for Jupiter, Uranus and Neptune.

- Consider using [angles.js](https://github.com/infusion/Angles.js) and [kepler.js](https://github.com/jordanstephens/kepler.js).

## References

Big thanks to the authors of the awesome resources below:

Articles:

- [StackExchange answer](https://space.stackexchange.com/questions/8911/determining-orbital-position-at-a-future-point-in-time) by 2012rcampion that might as well be an article
- [Keplerian Elements for Approximate Positions of the Major Planets](https://ssd.jpl.nasa.gov/txt/aprx_pos_planets.pdf) (PDF) by E M Standish
- [Computing planetary positions - a tutorial with worked examples](http://www.stjarnhimlen.se/comp/tutorial.html) by Paul Schlyter
- [Wikipedia entry on Orbital Elements](https://en.wikipedia.org/wiki/Orbital_elements)

Open source projects:

- [jsOrrery](https://github.com/mgvez/jsorrery) by Martin Vézina
- [D3-Orrery](https://github.com/ofrohn/d3-orrery) by Olaf Frohn
- [Asterank](https://github.com/typpo/asterank) by Ian Webster
- [Celestia](https://celestiaproject.net/) by Chris Laurel
- [solar-system-threejs](https://github.com/sanderblue/solar-system-threejs) by Sander Blue

## License

MIT
