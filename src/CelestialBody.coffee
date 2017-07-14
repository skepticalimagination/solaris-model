import publicize from './helpers/publicizer'
import units from './helpers/units'
import angles from './helpers/angles'
import time from './helpers/time'
import constants from './data/constants'
import Quaternion from 'quaternion'

class $CelestialBody
  constructor: (@key, data, @central) ->
    # @public
    {@name, @type, @radius, @elements, @mass, @tilt, @ring, @position} = @adaptData(data)

    # μ / Mu / GM (https://en.wikipedia.org/wiki/Standard_gravitational_parameter)
    # @public
    @mu = constants.G * @mass # m^3/s^2

    @satellites = Object.create(null)

  adaptData: (data) ->
    data.radius = units.kmToMeters(data.radius)
    data.mass ?= 1

    if data.ring
      data.ring.innerRadius = units.kmToMeters(data.ring.innerRadius)
      data.ring.outerRadius = units.kmToMeters(data.ring.outerRadius)
    
    if data.elements # not the sun or another static body
      if data.elements.format in ['jpl-satellites-table', 'heavens-above']
        data.elements.base.a = units.kmToMeters(data.elements.base.a)
      else
        data.elements.base.a = units.AUToMeters(data.elements.base.a)
        data.elements.base.cy = units.AUToMeters(data.elements.base.cy) if data.elements.base.cy

    data

  # @public
  setTime: (@time) ->
    if @elements
      @position = @getPositionAtTime(@time)

    return

  # @public
  getPositionAtTime: (t) ->
    {a, e, i, L, lp, node, w, M, E} = @getElementsAtTime(t)
    [i, node, w, M, E] = [i, node, w, M, E]
      .map (v) -> angles.degreesToRadians(v)
      .map (v) -> angles.normalizeRadians(v)

    x = a * (Math.cos(E) - e)
    y = a * Math.sin(E) * Math.sqrt(1 - Math.pow e, 2)

    tilt = if @central?.tilt then angles.degreesToRadians(-@central.tilt) else 0
    
    Quaternion.fromEuler(node, tilt, 0, 'XYZ')
      .mul Quaternion.fromEuler(w, i, 0, 'XYZ')
      .rotateVector([x, y, 0])

  # @public
  getElementsAtTime: (t) ->
    [a, e, i, L, lp, node] = (@getElementAtTime(el, t) for el in ['a', 'e', 'i', 'L', 'lp', 'node'])
    w = lp - node # argument of periapsis
    M = @getMeanAnomaly(L, lp, t)
    E = @getEccentricAnomaly(M, e)

    if @central
      # in seconds (# https://en.wikipedia.org/wiki/Orbital_period#Small_body_orbiting_a_central_body)
      period = 2 * Math.PI * Math.sqrt(Math.pow(a, 3) / @central.mu)

    {a, e, i, L, lp, node, w, M, E, period}

  # @public
  getOrbitPath: ->
    {period} = @getElementsAtTime(@time)

    points = []
    msPerPeriodsDegree = (period * 1000) / 360

    for i in [0...359]
      t = time.addMilliseconds(@time, msPerPeriodsDegree * i)
      points.push @getPositionAtTime(t)

    points.push points[0].slice()

    points

  # @public
  getElementAtTime: (name, t) ->
    value = @elements.base[name]

    if @elements.cy?[name] # cy = variation of element from base, per century
      value += (@elements.cy[name] * time.centuriesBetween(t, time.J2000))

    value

  getMeanAnomaly: (L, lp, t) ->
    M = L - lp

    if @elements.day?.M
      M += (@elements.day.M * time.daysBetween(t, time.J2000))

    M

  getEccentricAnomaly: (M, e) ->
    E = M

    while true
      dE = (E - e * Math.sin(E) - M) / (1 - e * Math.cos(E))
      E -= dE
      break if Math.abs(dE) < 1e-6

    E

export default class CelestialBody extends publicize $CelestialBody,
  properties: [
    'key', 'name', 'type', 'radius', 'elements', 'mass', 'tilt'
    'ring', 'position', 'central', 'mu', 'satellites'
  ]
  methods: ['setTime', 'getPositionAtTime', 'getElementsAtTime', 'getElementAtTime', 'getOrbitPath']
