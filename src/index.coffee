import publicize from './helpers/publicizer'
import units from './helpers/units'
import time from './helpers/time'

import CelestialBody from './CelestialBody'
import data from './data/bodies'

class $SolarSystem
  constructor: ->
    # @public
    @bodies = Object.create(null)
    
    @importBodies(data)

    @setTime new Date

  importBodies: (bodies, central) ->
    for k, v of bodies
      body = new CelestialBody(k, v, central)

      @bodies[k] = body
      central.satellites[k] = body if central
      @importBodies(v.satellites, body) if v.satellites

    return

  # @public
  setTime: (input) ->
    @time = if typeof input is 'string' then time.parse(input) else input

    body.setTime(@time) for k, body of @bodies

    return

export default class SolarSystem extends publicize $SolarSystem,
  properties: ['bodies', 'time']
  methods: ['setTime']
